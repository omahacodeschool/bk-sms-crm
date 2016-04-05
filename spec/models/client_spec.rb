require 'rails_helper'

RSpec.describe Client, type: :model do

   describe "#most_recent_message" do
    it "was the most recent message" do
      client = Client.new(id: 1)
      @time_now = Time.parse("Apr 05 2016")
      Time.stub!(:now).and_return(@time_now)
      touch1 = Touch.new(client_id: 1, created_at: Time.now + 5)
      touch2 = Touch.new(client_id: 1, created_at: Time.now + 10)
      touch3 = Touch.new(client_id: 1, created_at: Time.now + 20)
      assert_equal(touch3, client.most_recent_message)
    end
  end

end
