class Appointment < ApplicationRecord
  belongs_to :user
  has_many :appointment_services
  has_many :services, through: :appointment_services
end
