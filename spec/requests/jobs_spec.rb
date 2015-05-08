require 'rails_helper'

RSpec.describe "Users", type: :request do

  include RequestHelper

  describe "POST /users/:user_id/jobs" do

    before do
      @user = create :user
      log_in_as @user
      params[:query] = 'SELECT COUNT(*) FROM Posts WHERE Published BETWEEN "2015-04-01" AND "2015-04-30"'
      params[:query_status] = :planning
    end

    it "creates job resource" do
      post user_jobs_path(@user), params
      expect(response).to have_http_status(201)
    end

    context "when invalid parameters" do
      before { params.delete(:query) }
      it "returns 422" do
        post user_jobs_path(@user), params
        expect(response).to have_http_status(422)
      end
    end

    context "when logout" do
      before { log_out_as @user }
      it "returns 403" do
        post user_jobs_path(@user), params
        expect(response).to have_http_status(403)
      end
    end

  end

end
