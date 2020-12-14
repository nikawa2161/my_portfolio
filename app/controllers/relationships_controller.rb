class RelationshipsController < ApplicationController
  def show
    @company = Company.find(params[:id])
  end
end