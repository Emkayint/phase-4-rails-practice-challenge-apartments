class Tenant < ApplicationRecord
  # Relations
  has_many :leases, dependent: :destroy
  has_many :apartments, through: :leases

  # validations
  validates :name, presence: true
  validates :age, presence: true
  validate :age_greater_than_eighteen

  def age_greater_than_eighteen
    if age < 18
      errors.add(:age, "invalid entity")
    end
  end
end
