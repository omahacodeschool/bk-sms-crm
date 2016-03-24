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
    business = user.business
    client = business.client         
    touches = client.touches

    user = current_user
    business = Business.where("user_id" => user.id)
    client = Client.where("business_id" => business.id)
    touch = Touch.where("business_id" => business.id)


    @touch = touch.where("message LIKE '%#{params[:search]}%'") 
  
    @first_name = client.where("first_name LIKE '%#{params[:search]}%'")

    @last_name = client.where("last_name LIKE '%#{params[:search]}%'")

    @phone_number = client.where("phone_number LIKE '%#{params[:search]}%'")

    @notes = client.where("notes LIKE '%#{params[:search]}%'")

    render "search"
  end
end








