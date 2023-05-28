class FoodsController < ApplicationController
  def index
    # foods
    unless user_signed_in?
      # should not display the foods of the logged in user if the user is not logged in!
      redirect_to '/users/sign_in'
    end
    @foods = current_user.foods
  end

  def new
    # foods/new
    @food = Food.new
  end

  def create
    # creates a food
    @user = current_user
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_path
    else
      flash[:alert] = 'Food could not be saved.'
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def calculate_total(shopping_list)
    total = 0
    shopping_list.each do |element|
      total += element.quantity * element.food.price
    end
    total
  end

  def generate_shopping_list(recipe, foods)
    shopping_list = []
    recipe.recipe_foods.each do |recipe_food|
      existing_food = foods.find { |food| food.name == recipe_food.food.name }
      difference = recipe_food.quantity - existing_food.quantity
      next unless difference.positive?

      existing_shopping_food = shopping_list.find { |element| element.food.name == recipe_food.food.name }
      if existing_shopping_food.nil?
        recipe_food.quantity = difference
        shopping_list.push(recipe_food)
      else
        existing_shopping_food.quantity += recipe_food.quantity
      end
    end
    shopping_list
  end

  def general_shopping_list
    @foods = current_user.foods
    @shopping_list = []
    current_user.recipes.each do |recipe|
      @shopping_list.concat(generate_shopping_list(recipe, @foods))
    end
    @total = calculate_total(@shopping_list)
  end

  def shopping_list
    @foods = current_user.foods
    @recipe_id = params[:recipe_id]
    @recipe = current_user.recipes.find_by(id: @recipe_id)
    if @recipe.nil?
      redirect_to '/public_recipes'
    else
      @shopping_list = generate_shopping_list(@recipe, @foods)
      @total = calculate_total(@shopping_list)
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :quantity, :price)
  end
end
