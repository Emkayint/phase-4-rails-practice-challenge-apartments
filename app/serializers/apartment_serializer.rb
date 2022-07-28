class ApartmentSerializer < ActiveModel::Serializer
  attributes :id, :number

  # relationships
  has_many :leases
  has_many :tenants, through: :leases
end
