class Api::V1::SessionsController < ApplicationController

  def create
    @user = User.where(email: params[:email]).first

    if @user.valid_password?(params[:password])
      render :create, status: :created
    else
      render :unauthorized, status: :unauthorized
    end
  end

end