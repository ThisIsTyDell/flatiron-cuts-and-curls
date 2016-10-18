class Appointment < ActiveRecord::Base
  belongs_to :user
  has_many :appointment_services
  has_many :services, through: :appointment_services

  attr_accessible :date, :hour, :done

  validates :date,  :presence => true
  validates :hour,  :presence => true, :uniqueness => {:scope => :date}
end
