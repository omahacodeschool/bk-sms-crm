class PagesController < ApplicationController
  def dashboard_business
    @business = current_user.businesses.find_by_id(params[:id])

    if @business.nil?
      redirect_to("/businesses/view")
    else
      @clients = @business.clients

      if Touch.where({"client_id" => @current_client}) != nil
        @touches = Touch.where({"client_id" => @current_client})
      else
        @touches = nil
      end
    end
  end

end