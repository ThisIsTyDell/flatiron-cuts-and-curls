class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @service = Service.new
  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def set_user
    @service = Service.find(params[:id])
  end


  def service_params
    params.require(:service).permit(:title, :price)
  end

end
