class UsersController < ApplicationController
  before_action :authenticate_user!, except: :new

  def index
    @user = User.all
  end
  def new
    # @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @items = @user.items
    # @profile = Profile.new
    @user.profile.image = "default.png"
    @profile = Profile.find_by(user_id: @user.id)
    @created_at = @user.created_at
    # @zipcode = user.zipcode
    @address = @user.address
    # @city = user.city
    # @street = user.street
    # @card = Credit.where(user_id: current_user.id)
  end

  def likes
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end
  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

end
