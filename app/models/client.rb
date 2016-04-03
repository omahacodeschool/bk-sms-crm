class Client < ActiveRecord::Base
  include PgSearch
  has_many :touches
  belongs_to :business

  multisearchable :against => [:first_name, :last_name, :phone_number, :notes]

  
   #Finds all messages and puts in them in order of their creation
   #
   #Returns the first Touch object
   def most_recent_message
    self.all_sent_messages.order("created_at DESC").first
   end

   #Loops through all incoming Touches to get the time stamps
   #
   #Returns a String
   def date
    time_stamp = ""
    all_sent_messages.each do |p|
      time_stamp = p.created_at.strftime("%m/%d/%y")
    end
    return time_stamp
   end

   #Finds the incoming Touch objects of a specific client
   #
   #Returns an Active Record realtion
   def all_sent_messages
    Touch.where("client_id = ? and outgoing = ?", self.id, false) 
  end

end
