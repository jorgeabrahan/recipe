class FoodsController < ApplicationController
  def index
    # foods
    @foods = Food.all # TODO: implement current_user method and remove this line
    # @foods = current_user.foods
  end
end
