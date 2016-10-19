class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @service = Service.new
    @service.build_category
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to service_path(@service.id)
    else
      render :new
    end
  end

  def show
  end  

  def edit

  end

  def update

  end

  private

  def set_service
    @service = Service.find(params[:id])
  end


  def service_params
    params.require(:service).permit(:title, :price, category_ids:[], category_attributes: [:title])
  end

end
