class Client < ActiveRecord::Base
  include PgSearch
  has_many :touches
  belongs_to :business

  multisearchable :against => [:first_name, :last_name, :phone_number, :notes]

   def recent_touches
    self.touches # TODO Make this only return one touch for the client.
   end
   
   def most_recent_message
    self.all_sent_messages.order("created_at DESC").first
   end

   def date
    time_stamp = 1
    all_sent_messages.each do |p|#looping through the AR relation to extract the attribute and set 'time_stamp' to the string of the attribute
      time_stamp = p.created_at.to_formatted_s(:short).split[0..1].join(' ')
    end
    return time_stamp   
     
   end
   def all_sent_messages
    Touch.where("client_id = ? and outgoing = ?", self.id, false) #an ActiveRecord relation of incoming messages for this client
  end
end
