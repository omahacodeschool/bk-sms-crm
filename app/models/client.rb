class Client < ActiveRecord::Base
  include PgSearch
  has_many :touches
  belongs_to :business

  multisearchable :against => [:first_name, :last_name, :phone_number, :notes]

   def recent_touches
    self.touches # TODO Make this only return one touch for the client.
   end

end

