class Scoring < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  
  attr_accessible :topic_id, :user_id, :vote
end
