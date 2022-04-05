class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
    @recipe = Recipe.new
    @categories = Category.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @new_recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @category = @recipe.category

    if @recipe.save
      redirect_to category_recipes_path(@category)
    else
      render :index
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredients, :portion, :category_id)
  end
end
