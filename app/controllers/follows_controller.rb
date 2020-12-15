class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow!(params[:relationship_id])
    redirect_to relationship_path(params[:relationship_id])
  end
end