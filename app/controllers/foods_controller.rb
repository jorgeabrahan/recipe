class FoodsController < ApplicationController
  def index
    # foods
    @foods = Food.all # TODO: implement current_user method and remove this line
    # @foods = current_user.foods
  end

  def new
    # foods/new
    @food = Food.new
  end

  def create
    # creates a food
    @user = User.find(1) # TODO: implement current_user method and remove this line
    # @user = current_user
    @food = Food.new(food_params)
    @food.user = @user
    # @food.user = current_user

    if @food.save
      redirect_to foods_path
    else
      flash[:alert] = 'Food could not be saved.'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id]) # TODO: implement current_user method and remove this line
    # @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def general_shopping_list
    @shopping_list = []
    @total = 0
    # for each current user recipe
    # current_user.recipes.each do |recipe|
    User.first.recipes.each do |recipe|
      # for each recipe food in the recipe
      recipe.recipe_foods.each do |recipe_food|
        # if the recipe food is already added in the current user foods array
        existing_food = @shopping_list.find { |element| element.food.name == recipe_food.food.name }
        if existing_food.nil?
          @shopping_list.push(recipe_food)
        else
          existing_food.quantity += recipe_food.quantity
        end
        @total += recipe_food.food.price * recipe_food.quantity
      end
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
