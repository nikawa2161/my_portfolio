class CompanyProfilesController < ApplicationController
  before_action :authenticate_company!

  def show
    @profile = current_company.company_profile
  end

  def edit
    @profile = current_company.prepare_company_profile
  end

  def update
    @profile = current_company.prepare_company_profile
    @profile.assign_attributes(company_profile_params)
    if @profile.save
      redirect_to company_profile_path, notice: 'プロフィール更新！'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def company_profile_params
    params.require(:company_profile).permit(
      :company_name,
      :introduction,
      :address,
      :phone_number,
      :subscribed,
      :avatar
    )
  end
end
