require 'rails_helper'

RSpec.describe User, type: :model do
  it "should be valid" do
    user = User.new
    user.name = "toyamarinyon"
    expect(user).to be_valid
  end

  describe "name" do
    it "should be present" do
      user = User.new
      user.name = ""
      expect(user).not_to be_valid
    end
    it "should not be too long" do
      user = User.new
      user.name = "a"*51
      expect(user).not_to be_valid
    end
  end

end
