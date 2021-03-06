class TimeSlot < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments

  def self.available
    where(booked: false)
  end

  def book
    self.booked = true
    self.save
  end

  def make_available
    self.booked = false
    self.save
  end
end