class CarsController < ApplicationController
  before_action :set_car, only: [:destroy, :edit, :show, :update]

  def create
    car = ::Car.new(car_params)
    if car.save
      flash[:success] = 'Successfully created a new car.'
    else
      flash[:error] = 'Could not create car.'
    end
    redirect_to location_cars_path(params[:location_id])
  end

  def destroy
    @car.destroy
    redirect_to location_cars_path(params[:location_id])
  end

  def edit
  end

  def index
    @cars = ::Car.all
  end

  def new
    @car = ::Car.new
  end

  def show
  end

  def update
    if @car.update(car_params)
      redirect_to location_car_path(@location.id, @car.id)
    else
      flash[:error] = 'Could not update car.'
      render 'edit'
    end
  end

  private

  def car_params
    params.require(:car).permit(:location_id, :make, :model, :price, :sold, :sold_by, :sold_price)
  end

  def set_car
    @car = @location.cars.find(params[:id])
  end

  def set_location
    @location = ::Location.find(params[:location_id])
  end

end
