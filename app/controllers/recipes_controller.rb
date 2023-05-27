class RecipesController < ApplicationController
  before_action :set_user, expect: [:update]
  def index
    # @user=current_user
    @recipes = @user.recipes
  end

  def new
    # recipes/new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def create
    # creates a recipe
    # @user = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path
    else
      flash[:alert] = 'Food could not be saved.'
      render :new
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    text = @recipe.public? ? 'public' : 'private'

    if @recipe.save
      flash[:notice] = "#{@recipe.name} is now #{text}!"
    elsif @recipe.errors.any?
      flash[:alert] = @recipe.errors.full_messages.first
    end
    redirect_to recipe_path(id: @recipe.id)
  end

  private

  def set_user
    @user = current_user
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
