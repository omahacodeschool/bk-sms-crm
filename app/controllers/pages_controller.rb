class PagesController < ApplicationController
  def dashboard_business
    @business = Business.find_by_id(params[:business_id])

    @clients = @business.clients
  end

  def dashboard
    @list_clients = Client.where({"active" => true})
    @touches = Touch.all
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end

    # The view being rendered is not dependent on the value of @client.
    # It's just the view located at views/pages/dashboard.html.erb.
    render "pages/dashboard"
  end
end