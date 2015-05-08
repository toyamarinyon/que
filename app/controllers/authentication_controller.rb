class AuthenticationController < ApplicationController

  before_action :authentication_user_from_token, only: :destroy

  def create
    @user ||= User.find_by email: params[:email]
    if @user && @user.authenticate(params[:password])
      authentication
      render json: @user
    else
      render json: { error: { message: 'wrong email or password' } }, status: 422
    end
  end

  def destroy
    current_user.destroy_authentication
  end

end

