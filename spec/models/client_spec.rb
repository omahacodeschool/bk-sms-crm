require 'rails_helper'

RSpec.describe Client, type: :model do

   describe "#most_recent_message" do
    it "was the most recent message" do
      client = Client.new(id: 1)
      touch1 = Touch.new(client_id: 1, created_at: 10.seconds.ago)
      touch2 = Touch.new(client_id: 1, created_at: 5.seconds.ago)
      touch3 = Touch.new(client_id: 1, created_at: Time.now)
      assert_equal(touch3, client.most_recent_message)
    end
  end

end
