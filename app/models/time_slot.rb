class TimeSlot < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  def self.available
    where(booked: false)
  end
end