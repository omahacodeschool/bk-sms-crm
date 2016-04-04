class Client < ActiveRecord::Base
  include PgSearch
  has_many :touches
  belongs_to :business

  multisearchable :against => [:first_name, :last_name, :phone_number, :notes]

  
   #Finds all Touch objects and puts in them in order of their creation
   #
   #Returns the first Touch object
   def most_recent_message
    self.touches.order("created_at DESC").first
   end

end
