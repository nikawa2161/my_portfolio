class TopController < ApplicationController

  def new_guest_user
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def new_guest_company
    company = Company.guest
    sign_in company
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
