class PagesController < ApplicationController

  def dashboard_business
    @business = current_user.businesses.find_by_id(params[:business_id])

    if @business.nil?
      redirect_to("/businesses/view")
    else
      @clients = []
      @business.clients.each do |client|
        if Touch.where({"client_id" => @current_client}) != nil
          @clients << client
        end
      end
      return @clients
    end
  end
  
end