class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_address, only: [:edit, :update]

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  private

  def set_user_address
    @user = User.find(params[:id])
    @address = Address.find_by(user_id: @user.id)
  end

  def address_params
    params.require(:address).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :zipcode,
      :city,
      :area,
      :street,
    ).merge(user_id: current_user.id)
  end
end
