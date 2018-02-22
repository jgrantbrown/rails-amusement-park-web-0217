class RidesController < ApplicationController



  def new
      
      # Need to code how to pass attraction id to this controler in button submition
     ride = Ride.create(:user_id => current_user.id , :attraction_id => params[:attraction_id])
     flash[:notice]=ride.take_ride
     redirect_to user_path(current_user)
  end
end
