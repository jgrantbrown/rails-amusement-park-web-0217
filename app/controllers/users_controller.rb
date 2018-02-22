class UsersController < ApplicationController
  before_action :login_required, only: [:show]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    if @user
      flash[:notice]
      render 'users/show'
    else
      redirect_to '/signin_path'
    end
  end

  # def update
  #   ride = Ride.create(:user_id => current_user.id , :attraction_id => 2)
  #   ride.take_ride
  #   redirect_to user_path(current_user)
  # end





  private

    def user_params
      params.require(:user).permit(:name,:password,:nausea,:happiness,:tickets,:height,:admin)
    end
end
