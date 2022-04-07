class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @categories = policy_scope(Category).order(created_at: :desc)
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to user_path(current_user)
    else
      render :new
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
