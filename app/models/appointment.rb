class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_slot
  has_many :appointment_services
  has_many :services, through: :appointment_services
  accepts_nested_attributes_for :services
end