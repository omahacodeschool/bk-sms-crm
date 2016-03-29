class MessageController < ApplicationController
  def current_messages
    user = current_user
    @client = Client.find_by_id(params[:client_id])
    @touch = @client.touches
    
    @incoming = @touch.where("outgoing" => false)
    @outgoing = @touch.where("outgoing" => true)
    render "thread", layout: nil
  end
end