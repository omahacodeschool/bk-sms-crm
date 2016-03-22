class PagesController < ApplicationController
  def dashboard
    @list_clients = Client.all
    @client = Client.find_by_id(params[:client_id])
    render "dashboard/#{@client.id}"
  end
end