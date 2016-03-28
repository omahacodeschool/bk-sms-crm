class MessageController < ApplicationController
  def current_messages
    touch = 1
    user = current_user

    @client = Client.find_by_id(params[:client_id])
    @touch = Touch.where("client_id" => @client.id)
    
    @incoming = @touch.where("outgoing" => false)
    @outgoing = @touch.where("outgoing" => true)
    
    render "thread"
  end
end