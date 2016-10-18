class AppointmentsController < ApplicationController

  def index

  end

  def new
    @appointment = Appointment.new
  end

  def create
    available = Appointment.new(appointment_params).available?
    available ? redirect_to user_path(user) : render :new
  end

end
