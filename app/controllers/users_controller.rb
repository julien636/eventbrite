class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :only_see_own_page, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def is_current_user?
    
    unless current_user.id!=params[:id]
      flash[:notice] = "Please log in."
      redirect_to new_user_session_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_update)
      flash[:success] = "User succesfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def only_see_own_page
    @user = User.find(params[:id])
  
    if current_user != @user
      redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
  def user_update
    params.require(:user).permit(:first_name, :last_name, :description, user: current_user)
  end
end
