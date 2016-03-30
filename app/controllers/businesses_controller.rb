class BusinessesController < ApplicationController
  def user_authorized_business
    @business = current_user.businesses.find_by_id(params[:id])
    if @business.nil?
      redirect_to("/businesses/view")
    else
     return @business
   end
  end
    
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
    user_authorized_business
    render 'edit'
  end

  def update
    user_authorized_business
    @business.business_phone = params[:business_phone]
    @business.name = params[:name]
    @business.save
    redirect_to "/businesses/view"
  end

  def delete
    user_authorized_business
    Business.destroy(@business)
    redirect_to "/businesses/view"
  end

  def select
    user_authorized_business
    redirect_to "/dashboard/business/#{@business.id}"
  end

end