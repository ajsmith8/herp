class Tag < ActiveRecord::Base
  belongs_to :topic
  acts_as_url :content
  
  attr_accessible :content, :topic_id
  
  def to_param
    url
  end
  
  def tag_content
    tag.try(:content)
  end
  
  def tag_content=(content)
    self.tag = Tag.find_or_create_by_content(content) if content.present?
  end
end