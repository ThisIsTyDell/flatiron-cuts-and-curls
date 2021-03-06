class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @category
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end


  def category_params
    params.require(:category).permit(:title, service_ids:[], services_attributes: [:title, :price])
  end

end