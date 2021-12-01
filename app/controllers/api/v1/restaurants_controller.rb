class Api::V1::RestaurantsController < Api::V1::GraphitiController
  def index
    restaurants = RestaurantResource.all(params)
    respond_with(restaurants)
  end

  def show
    restaurant = RestaurantResource.find(params)
    respond_with(restaurant)
  end

  def create
    restaurant = RestaurantResource.build(params)

    if restaurant.save
      render jsonapi: restaurant, status: 201
    else
      render jsonapi_errors: restaurant
    end
  end

  def update
    restaurant = RestaurantResource.find(params)

    if restaurant.update_attributes
      render jsonapi: restaurant
    else
      render jsonapi_errors: restaurant
    end
  end

  def destroy
    restaurant = RestaurantResource.find(params)

    if restaurant.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: restaurant
    end
  end
end
