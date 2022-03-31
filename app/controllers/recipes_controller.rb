class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @category = Category.find(params[:category_id])
  end
end
