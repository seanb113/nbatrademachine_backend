class AuthController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: {
        message: "Logged In",
        successful: true,
        data: user,
        token: encode({"id": user.id})
      }
    else
      render json: {
        message: "Incorrect Username or Password",
        successful: false
      }
    end
  end
end
