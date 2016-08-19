class UsersController < ApplicationController

   def index
     @users = User.all 
   end

  def new 
  end 

  def create
    User.create(user_params) 
    redirect_to '/users'
  end 

  def show
    @user = User.find(params[:id])

  end

  def edit 
    @user = User.find(params[:id])
  end 

  def update 
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.save
    redirect_to '/users'
  end

  def destroy 
    user = User.find(params[:id])
    user.destroy
    redirect_to '/users'
  end

  private 

  def user_params 
    params.require(:user).permit( :first_name, :last_name, :email, :password, :confirm_password)
  end

end
