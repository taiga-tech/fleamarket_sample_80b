class ProfilesController < ApplicationController 
  def new 
    @user = User.find(params[:user_id])
    @profile = Profile.new
  end 
  def create   
    @user = User.find(params[:user_id])
    @profile = Profile.new(profile_params) 
    if @profile.update(profile_params)   
      redirect_to user_path(@user) 
    else 
      render :new 
  end   
end  
  def edit  
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
  end  
  def update  
    @user = User.find(params[:user_id])
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params) 
      redirect_to user_path(@user) 
    else 
      redirect_to user_path(@user)
  end  
end 
    private 
    def profile_params  
      params.require(:profile).permit(:text).merge(user_id: current_user.id)
    end 
end
