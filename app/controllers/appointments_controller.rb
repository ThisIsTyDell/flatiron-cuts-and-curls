class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @appointments = policy_scope(Appointment)
    authorize User
  end

  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize User
  end

  def create
    appointment = Appointment.new(appointment_params)
    if appointment.save
      appointment.time_slot.book
      redirect_to appointments_path
    else
      render :new
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.time_slot.make_available
    @appointment.destroy

    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day, service_ids:[]).merge(user_id: current_user.id)
  end

end
