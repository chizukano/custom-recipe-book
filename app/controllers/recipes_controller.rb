class RecipesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @recipes = policy_scope(Recipe).where(category_id: params[:category_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   @category = @recipe.category

  #   if @recipe.save
  #     redirect_to category_recipes_path(@category)
  #   else
  #     render :index
  #   end
  # end

  # private

  # def recipe_params
  #   params.require(:recipe).permit(:name, :description, :portion, :category_id)
  # end
end
