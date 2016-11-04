class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_service, only: [:edit, :update, :destroy]
  helper_method :params

  def index
    if params[:category_id] && params[:category_id] != " "
      @services = Category.find(params[:category_id]).services
    else
      @services = Service.all
    end
  end

  def new
    @service = Service.new(category_id: params[:category_id])
    
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
    params.require(:service).permit(:title, :price, :category_id, :avatar)
  end

end
