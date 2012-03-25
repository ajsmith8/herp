class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :scorings, dependent: :destroy
  has_many :commentscorings, dependent: :destroy
  has_ancestry cache_depth: true
  acts_as_url :content, sync_url: true
  
  attr_accessible :content, :pro_fieldname, :con_fieldname, :is_anon, :parent_id, :ispro, :description
  
  def to_param
    url
  end
  
  def topic_content
    topic.try(:content)
  end
  
  def topic_content=(content)
    self.topic = Topic.find_or_create_by_content(content) if content.present?
  end
end
