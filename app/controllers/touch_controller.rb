class TouchController < ApplicationController
  
  def create_new
    x = Touch.new
    x.business_id = (params[:business_id])
    x.client_id = (params[:client_id])
    x.message = (params[:message_content])
    x.outgoing = true
    x.read = true

    x.save

    render "create_message"
  end

  def current_conversation_thread

    ###### SETUP FOR TESTING
    current_business = Business.find_by_id(3)
    current_client = Client.find_by_id(4)
    ######

    @touches = Touch.where("business_id" => current_business.id)

    @current_conversation_touches = @touches.where("client_id" => current_client.id)

    render "current_conversation"
  end


  def list
    @touches = Touch.all
    render "touches"
  end

  def search_touch
    @results = PgSearch.multisearch(params[:search])
    
    render "search"
  end
end
