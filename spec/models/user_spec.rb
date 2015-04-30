require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = build :user
  end

  describe "name" do
    it "should be present" do
      @user.name = ""
      expect(@user).to_not be_valid
    end
    it "should not be too long" do
      @user.name = "a"*51
      expect(@user).to_not be_valid
    end
  end

  describe "email" do
    it "should be present" do
      @user.email = ""
      expect(@user).to_not be_valid
    end
    it "should not be too long" do
      @user.email = "test"+"a"*255 +"@gmail.com"
      expect(@user).to_not be_valid
    end
    it "should accept valid addresses" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid, "#{valid_addresses.inspect} should be valid"
      end
    end
    it "should not accept invalid addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                             foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid, "#{invalid_addresses.inspect} should be invalid"
      end
    end
    it "should be unique" do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to_not be_valid
    end
    it "should be case insensitive unique" do
      duplicate_user = @user.dup
      duplicate_user.email = @user.email.upcase
      @user.save
      expect(duplicate_user).to_not be_valid
    end
  end

  describe "password" do
    it "should not be too short" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to_not be_valid
    end
  end

end
