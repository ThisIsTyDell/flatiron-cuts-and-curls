class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :time_slot
  has_many :appointment_services, :dependent => :destroy
  has_many :services, through: :appointment_services
  accepts_nested_attributes_for :services

  validates :time_slot_id, presence: true
  validates :time_slot_id, uniqueness: true

  def dateandtime
    "#{self.time_slot.name} at #{self.time_slot.time}"
  end

  def total
    total = 0
    self.services.each do |service|
      total += service.price
    end
    return total
  end

end