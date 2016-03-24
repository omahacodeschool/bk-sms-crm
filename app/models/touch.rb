class Touch < ActiveRecord::Base
  belongs_to :client
  include PgSearch
  def self.search(search)
  # where("name LIKE ?", "%#{search}%") 
  where("message LIKE ?", "%#{search}%")
  end
  
end


class Shape < ActiveRecord::Base
  include PgSearch
end