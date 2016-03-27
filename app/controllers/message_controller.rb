class MessageController < ApplicationController
  def current_messages
    touch = 1
    user = current_user
    business = Business.find_by_id(params[:id])
    client = Client.where("business_id" => business.id)
    client.each do |client|
    @touch = Touch.where("client_id" => client.id)
    end
    @incoming = @touch.where("outgoing" => false)
    @outgoing = @touch.where("outgoing" => true)
    
    render "thread"
  end
end