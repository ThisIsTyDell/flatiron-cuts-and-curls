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

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day).merge(user_id: current_user.id)
  end

end
