class JobsController < ApplicationController

  include Garage::RestfulActions

  def require_resources
    if params[:user_id]
      @resources = User.find(params[:user_id]).jobs
    else
      @resources = Job.all
    end
  end

  def require_resource
    @resource = Job.find params[:id]
  end

  def create_resource
    @resources.create(job_params.merge(user_id: resource_owner_id))
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

    def job_params
      params.require(:job).permit(:query)
    end

end

