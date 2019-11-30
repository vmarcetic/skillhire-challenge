class Api::UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    render json: serializer.new(user)
  end

  def follow
    user = User.find(params[:user_id])
    follower = User.find(params[:id])
    user.followers << follower
    head :ok
  end

  def unfollow
    user = User.find(params[:user_id])
    follower = User.find(params[:id])
    user.followers.delete(follower)
    head :ok
  end

  private

  def user_params
    params.permit(:name, :username)
  end

  def serializer
    UserSerializer
  end
end