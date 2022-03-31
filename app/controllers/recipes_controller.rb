class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(category_id: params[:category_id])
    @category = Category.find(params[:category_id])
  end
end
