class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_service, only: [:edit, :update, :destroy]
  helper_method :params

  def index
    if params[:category_id] && params[:category_id] != " "
      @services = Category.find(params[:category_id]).services
    else
      @services = Service.all
      respond_to do |format|
        format.html { render :index }
        format.json { render json: @services }
      end
    end
  end

  def show
    @service = Service.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @service }
    end
  end

  def new
    @service = Service.new(category_id: params[:category_id])
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      if URI(request.referrer).path == new_service_path
        redirect_to services_path
      else
        render json: @service, status: 201
      end
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
