class UsersController < ApplicationController
  def index
    all_users = User.all
    
    render json: all_users.to_json(
    {:except => [:created_at, :updated_at, :password_digest]}
    )
  end

  def create 
    user = User.create(name: params["name"], team: params["team"], password:params["password"])
    
    render json: user
  end 

  def show
  end
end
