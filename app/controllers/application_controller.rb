class ApplicationController < ActionController::API

  private

  def authenticate_user
    if request.headers['Authorization'].present?
      user = User.find_by_authentication_token(request.headers['Authorization'])
      if user.present?
        @current_user = user
      else
        unauthorized_render
      end
    else
      unauthorized_render
    end

  end

  def unauthorized_render
    render json: { type: "Unauthorized", code: 401, message: "Invalid token", error: true },
        status: :unauthorized
  end
end
