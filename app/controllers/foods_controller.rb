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
      flash[:alert] = "Food could not be saved."
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id]) # TODO: implement current_user method and remove this line
    # @food = current_user.foods.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
