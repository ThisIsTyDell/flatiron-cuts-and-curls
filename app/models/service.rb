class Service < ApplicationRecord
  belongs_to :category
  has_many :appointment_services

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  def details
    "#{self.title} - $#{self.price}.00"
  end
end
