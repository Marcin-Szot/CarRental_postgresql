class SlotsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @slot = @car.slots.new(params[:slot].permit(:startdate, :enddate))

    # we need to check if booking is valid, it means:
    #  if end date of the booking is not lower than start date
    #  if booking does not interlace with some other bookings
    if @slot.startdate <= @slot.enddate
      @canBeSaved = true

      numberOfSlots = @car.slots.count-1
      @canBeSaved = 0.upto(numberOfSlots) do |i|
        if @slot.startdate >= @car.slots[i].startdate and @slot.startdate <= @car.slots[i].enddate
          break false
        elsif @slot.enddate >= @car.slots[i].startdate and @slot.enddate <= @car.slots[i].enddate
          break false
        elsif @slot.startdate <= @car.slots[i].startdate and @slot.enddate >= @car.slots[i].enddate
          break false
        end
      end
      @slot.save if @canBeSaved
    end
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:car_id])
    @slot = @car.slots.find(params[:id])
    @slot.destroy
    redirect_to car_path(@car)
  end
end
