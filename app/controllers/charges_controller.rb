class ChargesController < ApplicationController
  def new
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:amount],
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @appointment.paid = true
    @appointment.total_price_paid = params[:amount].to_i/100
    @appointment.save
    redirect_to appointment_path(@appointment)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
