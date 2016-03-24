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
    @user = current_user
    if Business.where({"user_id" => @user.id}) != nil
      @business_list = Business.where({"user_id" => @user.id})
    else
      @business_list = nil
    end
    render 'view'
  end

  def edit
    @user = current_user
    @business = Business.find_by_id(params[:id])
    render 'edit'
  end

    def update
    @user = current_user
    @business = Business.find_by_id(params[:id])
    @business.phone_number = params[:phone_number]
    @business.name = params[:name]
    @business.save
    redirect_to "/businesses/view"
  end

  def delete
    @user = current_user
    @business = Business.find_by_id(params[:id])
    Business.destroy(@business)
    redirect_to "/businesses/view"
  end

end