class Api::V1::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render status: :created
    else
      render json: { type: "Failure", code: 422, message: "Failure", error: true },
        status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
