class UsersController < ApplicationController  
  def new  
    @user = User.new 
  end 
  def show  
    user = User.find(params[:id])  
    @name = user.name  
    @items = user.items 
    @created_at = user.created_at    
    @profile = Profile.new 
    @profile = Profile.find(params[:id])  
    # @zipcode = user.zipcode 
    # @area = user.area 
    # @city = user.city 
    # @street = user.street  
  end   
  def likes 
  end 
end
