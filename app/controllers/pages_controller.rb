class PagesController < ApplicationController
  def dashboard
    @list_clients = Client.all

    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = Client.first
    end
    
    render "dashboard/#{@client.id}"
  end
end