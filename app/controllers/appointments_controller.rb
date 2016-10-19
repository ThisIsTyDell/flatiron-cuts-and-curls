class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = current_user.appointments
  end

  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    time_slot = TimeSlot.find(appointment_params[:time_slot_id])
    appointment = Appointment.new(appointment_params)
    if appointment.save
      time_slot.book
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day, service_ids:[]).merge(user_id: current_user.id)
  end

end
