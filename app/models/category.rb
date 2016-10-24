class Category < ApplicationRecord
  has_many :services
  accepts_nested_attributes_for :services
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, length: { in: 3..20}

  def services_attributes=(service_attributes)
    service_attributes.values.each do |service_attribute|
      service = Service.find_or_create_by(service_attribute)
      self.services << service
    end
  end
end
