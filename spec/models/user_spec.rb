require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build :user
  end

  it "should be valid" do
    expect(@user).to be_valid
  end

  describe "name" do
    it "should be present" do
      @user.name = ""
      expect(@user).not_to be_valid
    end
    it "should not be too long" do
      @user.name = "a"*51
      expect(@user).not_to be_valid
    end
  end

end
