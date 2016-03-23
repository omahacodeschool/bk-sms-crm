class BusinessesController < ApplicationController

  def new
    @business = Business.new
    @business.user_id = current_user
    @business.name = params[:name]
    @business.business_phone = params[:business_phone]
    @business.save
    redirect_to "/dashboard/business/#{business.id}"
  end
end