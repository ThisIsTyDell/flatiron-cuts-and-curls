class AppointmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    #@appointments = policy_scope(Appointment)
    @appointments = Appointment.where(user_id: params[:user_id])
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @appointments }
    end
  end

  def new
    @appointment = Appointment.new
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

  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.time_slot.make_available
    @appointment.destroy

    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, service_ids:[]).merge(user_id: current_user.id)
  end

end
