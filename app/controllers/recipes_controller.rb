class RecipesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @recipes = policy_scope(Recipe).where(category_id: params[:category_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe

    if @recipe.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :portion, :category, :photo)
  end
end
