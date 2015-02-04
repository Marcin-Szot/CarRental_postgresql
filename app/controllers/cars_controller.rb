class CarsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: :login

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params.require(:car).permit(:name, :category, :description))
    if @car.save
      redirect_to @car
    else
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.all
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end
end
