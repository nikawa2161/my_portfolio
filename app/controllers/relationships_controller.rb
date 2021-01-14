class RelationshipsController < ApplicationController
  def show
    @company = Company.find(params[:id])
    if @company == current_company
      redirect_to company_profile_path
    end
  end
end
