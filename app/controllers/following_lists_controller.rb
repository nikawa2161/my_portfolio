class FollowingListsController < ApplicationController
  before_action :authenticate_user!

  def show
    company_ids = current_user.followings.pluck(:id)
    @articles = Article.where(company_id: company_ids)

    @companies = Company.all
    rooms = current_user.rooms
    #自分が入ってるroomの相手のidを格納する
    @company_ids = []
    rooms.each do |r|
      @company_ids << r.company_id
    end

  end

end
