class MessageController < ApplicationController
  def current_messages
    user = current_user
    @client = Client.find_by_id(params[:client_id])
    @touch = @client.touches
    render "thread", layout: nil
  end
end