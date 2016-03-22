class PagesController < ApplicationController
  def dashboard
    @list_clients = Client.all

    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = Client.first
    end

    # The view being rendered is not dependent on the value of @client.
    # It's just the view located at views/pages/dashboard.html.erb.
    render "pages/dashboard"
  end
end