class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

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
    @recipe.user = current_user

    authorize @recipe

    if @recipe.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    @recipe.update(recipe_params)

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    authorize @recipe

    @recipe.destroy

    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :portion, :category_id, :photo)
  end
end
