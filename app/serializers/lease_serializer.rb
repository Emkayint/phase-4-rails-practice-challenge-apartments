class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :rent, :apartment_id, :tenant_id
  # relations
  belongs_to :apartment
  belongs_to :tenant
end
