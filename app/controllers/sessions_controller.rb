class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:email]) 

    if @user 
      session[:user_id] = @user.id
        redirect_to root_path
      # render json: {message: 'User Signed In Successfully', data: @user}, status: :ok
    else
      render new
      # render json: {message: 'Please Sign Up First'}, status: :bad_request  
    end
  end

  def destroy
    session[:user_id] = nil
      redirect_to root_path
    # render json: {message: 'User Signed Out Successfully'}, status: :ok
  end
end
