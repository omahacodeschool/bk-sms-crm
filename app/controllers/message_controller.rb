class MessageController < ApplicationController
  def current_messages
    user = current_user
    business = Business.where("user_id" => user.id)
    #loops the array of business AP relations giving the .id to
    #bring matching Touch objects
    business.each do |business|
    touch = Touch.where("business_id" => business.id)
    end
    #pulls the most recent touch object
    @post = touch.order("created_at").last
  end
end