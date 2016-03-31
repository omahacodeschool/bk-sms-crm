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
  def send_sms#if we add an argument of client.id....
    # @text_to_send = @x  #  << I have no idea what this is 
    text_recipient = Client.find_by_id(params[:client_id])#and pass it in here
    text_content = params[:message_content]
    text_sender_business = text_recipient.business #setting the business by the client
    add_touch = Touch.new
    add_touch.client_id = text_recipient.id 
    add_touch.message = text_content
    add_touch.outgoing = true
    add_touch.read = true  
    add_touch.save #adding this message to the database

    # Twilio credentials:
    account_sid = ENV["TWILIO_ACCOUNT_ID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"] 

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
     
    # Sending an SMS:

    @client.account.messages.create(
      :from => text_sender_business.business_phone, 


      :to => text_recipient.phone_number, 

      :body => text_content 

      # UNCOMMENT THIS (AND ADD SOME FUNCTIONALITY, PERHAPS) FOR MULTIMEDIA MESSAGE:
      # , :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg'
    )

    redirect_to "/dashboard/business/current_thread/#{text_recipient.id}"
    
  end

end
