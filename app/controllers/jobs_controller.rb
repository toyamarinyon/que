class JobsController < ApplicationController

  before_action :authentication_user_from_token, only: [:create]

  def create
    @job = current_user.jobs.build job_params
    if @job.save
      render json: @job, status: 201
    else
      render json: { :errors => @job.errors }, :status => 422
    end
  end

  private

    def job_params
      params.permit(:query)
    end

end

