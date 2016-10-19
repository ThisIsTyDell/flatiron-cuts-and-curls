class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @appointment = Appointment.new
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day, service_ids:[]).merge(user_id: current_user.id)
  end

end
