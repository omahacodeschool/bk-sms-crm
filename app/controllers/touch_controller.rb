class TouchController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:save_incoming_sms]

  def save_incoming_sms
    @i = Touch.new
    x = Client.where("phone_number" => params[:From].last(10))

    x.each do |e|
      @i.client_id = e.id
    end
    
    @i.message = params[:Body]
    @i.outgoing = false
    @i.read = false
    @i.save

    render nothing: true

  end  
  
  def show_new_form
    @client = Client.find_by_id(params[:client_id])
    render "create_message"
  end

  def current_conversation_thread
    @client = Client.find_by_id(params[:client_id])
    @business = @client.business
    @touches = @client.touches
  
    render "current_conversation", layout: nil
  end


  def list
    @touches = Touch.all
    render "touches"
  end

  def search_touch
    @results = PgSearch.multisearch(params[:search])
    
    render "search"
  end

  # Method takes a Touch object IF it is the most recent OUTGOING touch... and creates a text message from the data saved in the DB.
  #returns nil.
  #Also adds country code to phone number. Default is US ("+1")
  def send_sms
    client = Client.find_by_id(params[:client_id])
    touch = client.touches.create({message: params[:message_content], outgoing: true, read: true})

    # Twilio credentials:
    account_sid = ENV["TWILIO_ACCOUNT_ID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"] 

    # set up a client to talk to the Twilio REST API 
    @twilio = Twilio::REST::Client.new(account_sid, auth_token) 
     
    # Sending an SMS:
    @twilio.account.messages.create(
      :from => client.business.business_phone, 
      :to => client.phone_number, 
      :body => touch.message
    )

    redirect_to "/dashboard/business/current_thread/#{client.id}"
    
  end

end
