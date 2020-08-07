class ItemsController < ApplicationController
  def index
    @items = Item.all
    binding.pry
  end 
  def show  
    @items = Item.all
  end 
end
