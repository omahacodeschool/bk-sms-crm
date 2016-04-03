class PagesController < ApplicationController

  def dashboard_business
    @business = current_user.businesses.find_by_id(params[:business_id])
    @clients = @business.clients
    if @business.nil?
      redirect_to("/businesses/view")
    end
  end
end