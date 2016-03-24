class Business < ActiveRecord::Base
  include PgSearch
  belongs_to :user
  has_many :clients
  has_many :touches, through: "clients"
end
