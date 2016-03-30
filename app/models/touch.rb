class Touch < ActiveRecord::Base
  belongs_to :client
  include PgSearch

  multisearchable :against => [:message]
end
