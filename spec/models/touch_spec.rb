require 'rails_helper'

RSpec.describe Touch, type: :model do

  describe "#smart_time_date" do
    it "was sent before yesterday" do
      touch = Touch.new(created_at: Time.now)
      assert_equal("04/03/16", touch.smart_time_date)
    end
  end

  # describe "#smart_time_date" do
  #   it "was sent yesterday" do
  #     touch = Touch.new(created_at: 86500.seconds.ago)
  #     assert_equal("04/03/16", touch.smart_time_date)
  #   end
  # end

  # describe "#smart_time_date" do
  #   it "was sent before yesterday" do
  #     touch = Touch.new(created_at: Time.now)
  #     assert_equal("04/03/16", touch.smart_time_date)
  #   end
  # end

end
