class Appointment < ApplicationRecord
  belongs_to :user
  has_many :appointment_services
  has_many :services, through: :appointment_services

  attr_accessible :date, :hour
  vaidates :date, :presence => true
  vaidates :hour, :presence => true, :uniqueness => {:scope => :date}
end
