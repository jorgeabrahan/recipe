class RecipesController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end
end
