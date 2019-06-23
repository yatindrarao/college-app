class ApplicationController < ActionController::API

  private

  def authenticate_user
    # byebug
    if request.headers['Authorization'].present?
      user = User.find_by_authentication_token(request.headers['Authorization'])
      if user.present?
        @current_user = user
      else
        head :unauthorized
      end
    else
        head :unauthorized
    end

  end

  def current_user

  end
end
