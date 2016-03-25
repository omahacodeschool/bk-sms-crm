class BusinessesController < ApplicationController

  def new
    @business = Business.new
    @business.user_id = current_user.id
    @business.name = params[:name]
    @business.business_phone = params[:business_phone]
    @business.save
    redirect_to "/businesses/view"
  end

  def view
    render 'view'
  end

  def edit
    @business = Business.find_by_id(params[:id])
    render 'edit'
  end

  def update
    @business = Business.find_by_id(params[:id])
    @business.business_phone = params[:business_phone]
    @business.name = params[:name]
    @business.save
    redirect_to "/businesses/view"
  end

  def delete
    @business = Business.find_by_id(params[:id])
    Business.destroy(@business)
    redirect_to "/businesses/view"
  end

  def select
    @business = Business.find_by_id(params[:id])
    redirect_to "/dashboard/business/#{@business.id}"
  end

end