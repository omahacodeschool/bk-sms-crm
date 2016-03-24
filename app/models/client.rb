class Client < ActiveRecord::Base
  include PgSearch
  has_many :touches
  belongs_to :business


   def recent_touches
    self.touches # TODO Make this only return one touch for the client.
   end

   def Client.find_business_clients(id)
    list_touches = Touch.where({"business_id" => id})
    clients_belong_to_business = []
    list_touches.each do |touch|
      clients_belong_to_business << touch.client_id
    end
    return clients_belong_to_business
   end
end

