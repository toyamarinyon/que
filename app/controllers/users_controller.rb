class UsersController < ApplicationController

  include Garage::RestfulActions

  def require_resources
    if current_resource_owner
      @resources = User.find current_resource_owner.id
    else
      @resources = User.all
    end
  end

  def require_resource
    @resource = User.find(params[:id])
  end

  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     render json: @user
  #   else
  #     render json: { :errors => @user.errors }, :status => 422
  #   end
  # end
  #
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
