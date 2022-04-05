class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render :index
    end
  end

  # def edit
  #   @category = Category.find(params[:id])
  # end

  # def update
  #   @category = Category.find(params[:id])
  #   @category.update(category_params)

  #   if @category.save
  #     redirect_to categories_path
  #   else
  #     render :edit
  #   end
  # end

  private

  def category_params
    params.require(:category).permit(:name, :photo)
  end
end
