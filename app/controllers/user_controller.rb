class UserController < ApplicationController
  def add_new_business
    @business = Business.new
    @business.user_id = params[:user_id]
    @business.name = params[:name]
    @business.business_phone = params[:business_phone]
    @business.save
    @redirect_to "/user/#{@business.id}"
  end
  def settings
    @user = User.find_by_id(params:)
    render "user"
  end
  def change_user_settings
    @user = User.find_by_id(params[:id])
    @user.phone_number = params[:phone_number]
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.save
    redirect_to "/user/#{@user.id}"
  end
  def change_business_settings
    @business = Business.find_by_id(params[:id])
    @business.phone_number = params[:phone_number]
    @business.name = params[:name]
    @business.email = params[:email]
    @business.password = params[:password]
    @business.save
    redirect_to "/user/#{@business.id}"
  end

end

