class Apartment < ApplicationRecord
  has_many :leases, dependent: :destroy
  has_many :tenants, through: :leases
  
  # validations
  validates :number, presence: true, numericality: true
end
