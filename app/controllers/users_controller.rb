class UsersController < ApplicationController 
  def show  
    user = User.find(params[:id]) 
    @name = user.name 
    @items = user.items  
    # @zipcode = user.zipcode 
    # @area = user.area 
    # @city = user.city 
    # @street = user.street 
  end  
  def edit  
    @user = User.find(params[:id])
  end 
end
