require 'rails_helper'

RSpec.describe Touch, type: :model do

  # describe "#smart_time_date" do
  #   context "when the Touch's created_at date is today" do
  #   it "displays the time that the Touch's created_at" do
  #     touch = Touch.new(created_at: "Time.now")
  #     assert_equal("09:23", touch.smart_time_date)
  #   end

  #   context "when the Touch's created_at date is yesterday" do
  #   it "displays 'Yesterday'" do
  #     touch = Touch.new(created_at: "Date.today.prev_day")
  #     assert_equal("Yesterday", touch.smart_time_date)
  #   end 

  #   context "when the Touch's created_at date any thing else"
  #   it "displays the date of the Touch's created_at" do
  #     touch = Touch.new(created_at: "2.day.ago") #this actually returns that
  #     assert_equal("04/02/16", touch.smart_time_date)
  #   end 


  describe "#smart_time_date" do
    it "was sent before yesterday" do
      @time_now = Time.parse("Apr 03 2016")
      allow(Time).to receive(:now).and_return(@time_now)
      touch = Touch.new(created_at: Time.now - 2.day)
      touch.save
      assert_equal("04/01/16", touch.smart_time_date)
    end
  end

  it "was sent today" do
    @time_now = Time.parse("Apr 03 2016")
    allow(Time).to receive(:now).and_return(@time_now)
    touch = Touch.new(created_at: Time.now)
    touch.save
    assert_equal("05:00", touch.smart_time_date)
  end

  it "was sent yesterday" do
    @time_now = Time.parse("Apr 03 2016")
    allow(Time).to receive(:now).and_return(@time_now)
    touch = Touch.new(created_at: Time.now - 1.day)
    assert_equal("Yesterday", touch.smart_time_date)
  end

end



