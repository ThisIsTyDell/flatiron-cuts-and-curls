class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :time_slot_id, :paid, :total_price_paid
end
