class FollowingListsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    company_ids = current_user.followings.pluck(:id)
    @articles = Article.where(company_id: company_ids)
  end

end
