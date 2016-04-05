require 'rails_helper'

RSpec.describe Client, type: :model do

   describe "#most_recent_message" do
     it "was the most recent message" do
      client = Client.new(id: 1)
      client.save

      @time_now = Time.parse("Apr 05 2016")

      allow(Time).to receive(:now).and_return(@time_now)

      touch1 = Touch.new(client_id: 1, created_at: Time.now + 5)
      touch1.save
      touch2 = Touch.new(client_id: 1, created_at: Time.now + 10)
      touch2.save
      touch3 = Touch.new(client_id: 1, created_at: Time.now + 20)
      touch3.save

      assert_equal(touch3, client.most_recent_message)
    end
  end

end

