class TouchController < ApplicationController
  
  def create_new
    x = Touch.new
    x.business_id = (params[:business_id])
    x.client_id = (params[:client_id])
    x.message = (params[:message_content])
    x.outgoing = true
    x.read = true

    x.save

    redirect_to("/dashboard")
  end

  def list
    @touches = Touch.all
    render "touches"
  end
  def search_touch
    touches = Touch.all
    client = Client.all
    search = params[:search]
    #looks for 'search_for' directly from all touch messages
    # all_touch_messages = Touch.pluck(:message)
    @touch = Touch.where("message LIKE '%#{params[:search]}%'")
    @first_name = Client.where("first_name LIKE '%#{params[:search]}%'")
    @last_name = Client.where("last_name LIKE '%#{params[:search]}%'")
    # @hit = Touch.where(:message => "house")
    render "search"
  end
end