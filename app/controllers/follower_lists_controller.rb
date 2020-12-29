class FollowerListsController < ApplicationController
  before_action :authenticate_company!

  def show
    company_ids = current_company.followers.pluck(:id)
    @users = Profile.where(user_id: company_ids)

    @dms = User.all
    rooms = current_company.rooms
    #自分が入ってるroomの相手のidを格納する
    @dm_ids = []
    rooms.each do |r|
      @dm_ids << r.user_id
    end
  end
end