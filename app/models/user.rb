class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def generate_jwt_token
    JWT.encode( { id: id, exp: 1.days.from_now.to_i },
                Rails.application.secrets.secret_key_base
              )
  end
end
