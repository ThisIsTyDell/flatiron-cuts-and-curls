class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_service, only: [:edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
    @service.build_category
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @service.update(service_params)
      redirect_to services_path
    else
      render :edit
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end


  def service_params
    params.require(:service).permit(:title, :price, :category_id)
  end

end
