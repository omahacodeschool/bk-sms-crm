class Client < ActiveRecord::Base
   has_many :touches

   def recent_touches
    self.touches # TODO Make this only return one touch for the client.
   end
end

