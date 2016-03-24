class Business < ActiveRecord::Base
  belongs_to :user
  has_many :clients
  has_many :touches, through: "clients"
end
