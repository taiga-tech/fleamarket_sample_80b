class ItemsController < ApplicationController
  def index
    @items = Item.all
  end 
  def show  
    @items = Item.all
  end 
end
