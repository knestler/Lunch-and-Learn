class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(new_user_params)
    user.api_key = 'lnl_user' + SecureRandom.hex(20)
    user.save

    render json: UserSerializer.new(user), status: 201
  end

  private
  def new_user_params
    params.permit(:name, :email, :api_key)
  end
end