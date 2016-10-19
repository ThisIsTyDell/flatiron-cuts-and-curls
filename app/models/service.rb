class Service < ApplicationRecord
  belongs_to :category
  has_many :appointment_services
  accepts_nested_attributes_for :category

  def category_attributes=(category_attribute)
    category = Category.find_or_create_by(category_attribute)
    self.category = category
  end
end
