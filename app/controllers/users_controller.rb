class UsersController < ApplicationController
<<<<<<< HEAD
  
    def show
       @user = User.find(params[:id])
       @title = @user.name
    end
	
    def new
       @title = "Sign up"
    end
=======
  def new
    @title = "Sign up"
  end
>>>>>>> filling-in-layout
end
