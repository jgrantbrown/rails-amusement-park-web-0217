class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def signin
     @user = User.find_by(name: params[:user][:name])
       if @user && @user.authenticate(params[:user][:password])
         
         session[:user_id] = @user.id
         redirect_to user_path(@user), :notice => "Welcome back, #{@user.name}"
       else
         flash.now.alert = "Invalid email or password"
         redirect_to signin_path
       end
   end

  def destroy
    # Remove the user id from the session
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end


end
