class SuggestededitsController < ApplicationController
  before_filter :authenticate

  def create
    @edit = Suggestededit.new(params[:suggestededit])
    @edit.user_id = current_user.id
    @edit.save
    
    redirect_to Topic.find_by_id(@edit.topic_id)

  end
end