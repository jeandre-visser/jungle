class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name).all
  end

  def create
    @category = Category.new(params_category)
    if @category.save
      redirect_to [:admin, :categories], notice: "A new category has been added!"
    else
      render :new
    end
  end

  def new
      @category = Category.new
  end

  def params_category
    params.require(:category).permit(:name)
  end
    
end