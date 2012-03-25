class Commentscoring < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  
  attr_accessible :comment_id, :user_id, :vote, :topic_id
end
