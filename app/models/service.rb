class Service < ApplicationRecord
  belongs_to :category
  has_many :appointment_services

  validates :title, :price, :category_id, :description, presence: true
  validates :title, length: { in: 3..20 }
  validates :description, length: { maximum: 200 }

  def details
    "#{self.title} - $#{self.price}.00"
  end
end
