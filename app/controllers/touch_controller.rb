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
    
    #these should work based on the association, except for @client
    #which wont work because 'business doesnt not HAVE many clients'
    #
    #
    # business = user.business
    # client = business.client         if we add a user_id to client its fixed
    # touches = client.touches
    users_business =[]
    touched_by_business = []
    current_business = Business.where("user_id" => user.id)
    #now current_business is an AR relation (all of this users businesses)
    current_business.each do |p|
      users_business << p.id
    end
    #now users_business has an array with just the businesses ids [1,2]
    users_business.each do |p|
      touched_by_business << Touch.where("business_id" => p)
    end
    # touched_by_business now has an array of active record Touch relations
    # 
    client_list = []
    touched_by_business.each do |touch|
      client_list << Client.where(".id" => touch)
    end
    #now client_list has an array of AR relations
    touched_by_business_joined = touched_by_business.join
    
    #loops through the array of AR relations and gives them to @touch
    touched_by_business.each do |p|
    @touch = p.where("message LIKE '%#{params[:search]}%'") 
    end
    #loops through the array of AR relations searching desired columns
    #saving given variables
    #
    client_list.each do |p|
    @first_name = p.where("first_name LIKE '%#{params[:search]}%'")
  end
    client_list.each do |p|
    @last_name = p.where("last_name LIKE '%#{params[:search]}%'")
  end
  client_list.each do |p|
    @phone_number = p.where("phone_number LIKE '%#{params[:search]}%'")
  end
  client_list.each do |p|
    @notes = p.where("notes LIKE '%#{params[:search]}%'")
  end

    render "search"
  end
end






