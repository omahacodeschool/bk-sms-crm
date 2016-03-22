class PagesController < ApplicationController
  def dashboard
    @list_clients = Client.all
    @client = Client.find_by_id(1)
    @touches = Touch.all
    render "dashboard"
  end
end