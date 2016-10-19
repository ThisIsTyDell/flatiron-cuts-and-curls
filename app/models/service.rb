class Service < ApplicationRecord
  belongs_to :category
  has_many :appointment_services

  def details
    "#{self.title} - #{self.price}"
  end
end
