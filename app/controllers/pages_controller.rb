class PagesController < ApplicationController
  def dashboard
    @client = Client.find_by_id(1)
    render "dashboard"
  end
end