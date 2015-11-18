class UsersController < ApplicationController

    def new # render the signup form
        
    end

    def create # creates a new user in db
        User.create signup_params
        redirect_to root_path
    end

    def show
        @post = Posts.all
    end

    private

    def signup_params
          params.require(:user).permit(:email, :password, :name)
   end

end