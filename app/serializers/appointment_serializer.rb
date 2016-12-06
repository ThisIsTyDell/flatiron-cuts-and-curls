class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :time_slot_id, :paid, :total_price_paid
  belongs_to :time_slot
  has_many :services
end
