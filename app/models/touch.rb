class Touch < ActiveRecord::Base
  belongs_to :client
  include PgSearch

  multisearchable :against => [:message]
  
  def self.search(search)
  # where("name LIKE ?", "%#{search}%") 
  where("message LIKE ?", "%#{search}%")
  end
  
end