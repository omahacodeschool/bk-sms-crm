class PagesController < ApplicationController
  def dashboard
    @client = Client.find_by_id(1)
    @touches = Touch.all
    render "dashboard"
  end
end