class UsersController < ApplicationController
    
  def index 
       @users = User.all
  end 

  def show
       @user = User.find(params[:id])
       @recipes = Recipe.find_by(user_id: params[:id]) 
  end 

  def new
       @user = User.new
  end 

  def create
      @user = User.find_or_create_by(user_params)
      if @user.save
       redirect_to user_path(@user)
      else 
       render :new 
      end
  end 

  private

  def user_params
          params.require(:user).permit(:name, :password_digest)
  end 

end