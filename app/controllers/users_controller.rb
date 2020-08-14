class UsersController < ApplicationController  
  def new  
    @user = User.new 
  end 
  def show  
    user = User.find(params[:id]) 
    @name = user.name 
    @items = user.items    
    @profile = user.profile 
    @user = User.find(params[:id])
    # @zipcode = user.zipcode 
    # @area = user.area 
    # @city = user.city 
    # @street = user.street  
  end   
  def edit  
    @user = User.find(params[:id])
  end  
  def update  
    @user = User.find(params[:id])  
    if @user.update(user_params) 
    redirect_to user_path     
    else
    render :user
    end
  end  
  private 
  def user_params  
    params.require(:user).permit(:name, :id)
  end
end
