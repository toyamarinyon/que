require 'rails_helper'

RSpec.describe Job, type: :model do

  before do
    @user = create :user
    @job =  @user.jobs.build attributes_for(:job)
  end

  describe "user_id" do
    it "should be present" do
      @job.user_id = nil
      expect(@job).to_not be_valid
    end
  end

  describe "query" do
    it "should be present" do
      @job.query = nil
      expect(@job).to_not be_valid
    end
  end

  describe "query_status" do
    it "should accept Job.query_statuses" do
      Job.query_statuses.each do |query_status,index|
        @job.query_status = query_status
        expect(@job).to be_valid, "#{query_status} should be valid"
      end
    end
    it "should raise error except for Job.query_statuses" do
      %i(drafted started finish abort).each do |query_status,index|
        expect {@job.query_status = query_status}.to raise_error
      end
    end
  end
end
