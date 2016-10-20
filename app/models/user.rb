class User < ApplicationRecord
  enum role: [:normal, :employee, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :appointments
  has_many :time_slots, through: :appointments
  has_many :appointment_services, through: :appointments
  has_many :services, through: :appointment_services
  has_many :customers, class_name: "User", foreign_key: "stylist_id"
  belongs_to :stylist, class_name: "User"

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end      
  end

  def have_stylist?
    if self.stylist_id == 1
      false
    else
      true
    end
  end

  def self.employees
    where(role: 1)
  end
end
