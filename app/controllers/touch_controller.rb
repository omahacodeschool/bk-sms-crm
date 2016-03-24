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
    # business = user.business
    # client = business.client         
    # touches = client.touches

    user = current_user
    business = Business.where("user_id" => user.id)
    
    client = []
    business.each do |business|
    client<< Client.where("business_id" => business.id)
    end
    #
    #client is an array with AR relations (that businesses clients)
    #
    touched = []
    business.each do |business|
    touched << Touch.where("business_id" => business.id)
    end
    #
    #touched is an array with AR relations (that businesses touches)
    #
    #looping each array (giving ind. objects) through a where statement
    #
    touched.each do |touched|
    @touch = touched.where("message LIKE '%#{params[:search]}%'") 
    end
    client.each do |client|
    @first_name = client.where("first_name LIKE '%#{params[:search]}%'")
    end
    client.each do |client|
    @last_name = client.where("last_name LIKE '%#{params[:search]}%'")
    end
    client.each do |client|
    @phone_number = client.where("phone_number LIKE '%#{params[:search]}%'")
    end
    client.each do |client|
    @notes = client.where("notes LIKE '%#{params[:search]}%'")
    end
    render "search"
  end
end









