class CommentsController < ApplicationController 
  def create  
    @item = Item.find(params[:item_id]) 
    @comment = Comment.new 
    if @comment.update(comment_params)  
      redirect_to item_path(@item) 
    else 
      redirect_to item_path(@item)
    end 
  end   
  def destroy  
    @item = Item.find(params[:item_id]) 
    @comment = @item.comments.find(params[:id]) 
    @comment.destroy 
    redirect_to item_path(@item)
  end 
  private  
  def comment_params 
    params.require(:comment).permit(:text, :price, :item_id, :user_id)
end 
end

