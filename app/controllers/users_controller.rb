class UsersController < ApplicationController

    def index
        @users = User.all

        if @users
         render json: {message: "FETCHED ALL THE USERS SUCCESSFULLY", data: @users}, status: :ok
        else
         render json: {message: @users.errors}, status: :bad_request
        end
    end  

    def new 
       @user = User.new
    end

    def create
       @user = User.new(user_params)

       if @user.save
        render json: {message: 'User Created Successfully', data: @user}, status: :ok
       else
         render json: {message: 'User Not Created'}, status: :unproccessable_entity
       end
    end

private
   def user_params
      params.permit(:name, :email, :phone, :password, :confirm_password)
   end
end
