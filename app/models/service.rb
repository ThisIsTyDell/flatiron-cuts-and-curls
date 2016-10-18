class Service < ApplicationRecord
  belongs_to :category
  has_many :appointment_services
end
