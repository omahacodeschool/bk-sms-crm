class Touch < ActiveRecord::Base
  belongs_to :client

  def self.search(search)
  # where("name LIKE ?", "%#{search}%") 
  where("message LIKE ?", "%#{search}%")
  end
  
end
