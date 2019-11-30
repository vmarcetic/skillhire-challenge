class Api::FollowersController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: serializer.new(user.followers)
  end

  private

  def serializer
    UserSerializer
  end
end