class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy
  
    def index
       @title = "All users"
       @users = User.paginate(:page => params[:page])
    end

    def show
       @user = User.find(params[:id])
       @title = @user.name
    end
	
    def new
       @user = User.new
       @title = "Sign up"
    end


    def create
       @user = User.new(params[:user])
       if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to the Sample App!"
	  redirect_to @user
	       # Handle a successful save.
       else
	  @title = "Sign up"
	  render 'new'
       end
    end

    def edit
       @title = "Edit User"
    end

    def update
        @user = User.find(params[:id])
       if @user.update_attributes(params[:user])
	  flash[:success] = "Profile updated."
	  redirect_to @user
       else
	  @title = "Edit user"
	  render 'edit'
       end
    end

    def destroy
      User.find(param[:id])
      if @user != current_user
	 User.destroy
      flash[:success] = "User destroyed."
      else
	 flash[:error] = "Suicide Mission"
      end

      redirect_to users_path
    end


    private

       def authenticate
	  deny_access unless signed_in?
       end
    
       def show
         @user = User.find(params[:id])
         @microposts = @user.microposts.paginate(:page => params[:page])
         titile = @user.name
       end 

       def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
       end

       def admin_user
	 redirect_to(root_path) unless current_user.admin?
       end
end
