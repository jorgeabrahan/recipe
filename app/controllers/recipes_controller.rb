class RecipesController < ApplicationController
  def index; end

  def show; end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
