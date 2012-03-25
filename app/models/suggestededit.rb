class Suggestededit < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  
  attr_accessible :existing_content, :url, :suggestion, :topic_id, :ancestry, :user_id
end