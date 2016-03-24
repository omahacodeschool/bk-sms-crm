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

    user = current_user
    current_business = Business.where("user_id" => user.id)
    current_touches = Touch.where("business_id" => current_business.id)
    client_list = []

    current_touches.each do |p|
      client_list << p.client.id
    end

    current_clients = Client.where("")
    search = params[:search]
    #looks for 'search' directly from all touch messages
    @touch = current_touches.where("message LIKE '%#{params[:search]}%'") 
    #looks for a match in the client list with with same word
    @first_name = client_list.where("first_name LIKE '%#{params[:search]}%'")
    @last_name = client_list.where("last_name LIKE '%#{params[:search]}%'")
    @phone_number = client_list.where("phone_number LIKE '%#{params[:search]}%'")
    @notes = client_list.where("notes LIKE '%#{params[:search]}%'")

    render "search"
  end
end
