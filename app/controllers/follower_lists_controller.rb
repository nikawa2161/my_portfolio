class FollowerListsController < ApplicationController
  before_action :authenticate_company!
  
  def show
    user_ids = current_company.followers.pluck(:id)
    @profile = Profile.where(user_id: user_ids)
  end

end