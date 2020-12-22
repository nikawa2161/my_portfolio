class FollowerListsController < ApplicationController
  before_action :authenticate_company!

  def show
    company_ids = current_company.followers.pluck(:id)
    @users = Profile.where(user_id: company_ids)
  end
end