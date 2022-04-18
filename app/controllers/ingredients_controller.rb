class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = Ingredient.new

    authorize @recipe
  end
end
