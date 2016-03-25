class TouchController < ApplicationController
  require 'twilio-ruby'
  
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


  # Method takes a Touch object and its ID... and creates a text message from the data saved in DB.
  #returns nil.
  def send_sms(id)
    
    @text_to_send = Touch.find_by_id(id)  
    @text_recipient = Client.find_by_id(@text_to_send.client_id)
    @text_content = @text_to_send.message
    @text_sender_business = Business.find_by_id(@text_recipient.business_id)
    # credentials:

    account_sid = 'AC7f31bedb178e5c29681712d702181f29' 
    auth_token = '0b67f2ae87cae02e784c98378a806368' 

    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new(account_sid, auth_token) 
     
    # Sending an SMS:

    @client.account.messages.create(
      :from => @text_sender_business.business_phone, 
      :to => @text_recipient.phone_number, 
      :body => @text_content 

      # UNCOMMENT THIS (AND ADD SOME FUNCTIONALITY, PERHAPS) FOR MULTIMEDIA MESSAGE:
      # , :media_url => 'http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg'
    )
  end

end
