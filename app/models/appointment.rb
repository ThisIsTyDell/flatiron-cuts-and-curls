class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_slot
  has_many :appointment_services
  has_many :services, through: :appointment_services
  accepts_nested_attributes_for :services

  def dateandtime
    "#{self.time_slot.name} - #{self.time_slot.time}"
  end

  def all_services
    self.services.all
  end
end