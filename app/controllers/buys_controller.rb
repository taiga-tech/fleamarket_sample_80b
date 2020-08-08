class BuysController < ApplicationController 
  def create  
    @item = Item.find(params[:item_id]) 
    @buy = Buy.new 
    if @buy.update(buy_params)  
      redirect_to item_path(@item) 
    else 
      redirect_to item_path(@item)
    end 
  end   
  def destroy  
    @item = Item.find(params[:item_id]) 
    @buy = @item.buys.find(params[:id]) 
    @buy.destroy 
    redirect_to item_path(@item)
  end 
  private  
  def buy_params 
    params.require(:buy).permit(:item_id, :text, :price)
end 
end
