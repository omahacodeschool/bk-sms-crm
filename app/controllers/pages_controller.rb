class PagesController < ApplicationController
  def dashboard
    @list_clients = Client.all
    @client = Client.find_by_id(1)
    render "dashboard"
  end
end