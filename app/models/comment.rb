class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :commentscorings, dependent: :destroy
  
  attr_accessible :content, :ispro, :is_anon, :topic_id
end
