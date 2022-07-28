class Lease < ApplicationRecord
  belongs_to :tenant
  belongs_to :apartment

  # validations
  validates :rent, presence: true, numericality: true
  validates :apartment_id, presence: true, numericality: true
  validates :tenant_id, presence: true, numericality: true
end
