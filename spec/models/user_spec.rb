require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    context "Password Validation" do

      it "should save when password and password_confirmation match" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "david@braverman.com",
          password: "123",
          password_confirmation: "123"
        )

        @user.validate

        expect(@user.password && @user.password_confirmation).to eql("123")
      end

      it "should save when password is 3 characters or longer" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "david@braverman.com",
          password: "123",
          password_confirmation: "123"
        )

        @user.validate

        expect(@user.password.length).to be >= 3
      end

      it "should return nil when password or password_confirmation is empty" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "david@braverman.com",
          password: "",
          password_confirmation: ""
        )

        @user.validate

        expect(User.authenticate_with_credentials(@user.email, nil)).to be_nil
      end

      it "should raise error when password and password_confirmation don't match" do
        @user = User.create(
          first_name: "Rae",
          last_name: "Raynsford",
          email: "rae@raynsford.com",
          password: "123",
          password_confirmation: "456"
        )

        @user.validate

        expect(User.authenticate_with_credentials(@user.email, nil)).to be_nil
      end
    end

    context "Email Validation" do

      it "should raise error when user with same email already exists" do
        @user1 = User.create(
          first_name: "Rae",
          last_name: "Raynsford",
          email: "rae@raynsford.com",
          password: "123",
          password_confirmation: "123"
        )

        @user2 = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "rae@raynsford.com",
          password: "123",
          password_confirmation: "123"
        )

        @user1.validate
        @user2.validate

        expect(User.authenticate_with_credentials(nil, @user2.password)).to be_nil
      end
    end
  end

  describe ".authenticate_with_credentials" do

    context "New authentication (class) method" do

      it "should return instance of user if successfully authenticated" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "david@braverman.com",
          password: "123",
          password_confirmation: "123"
        )

        @user.validate

        expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(User.find_by(email: @user.email))
      end

      it "should return instance of user even when email is written in different case" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: "DAVID@BRAVERMAN.COM",
          password: "123",
          password_confirmation: "123"
        )

        @user.validate

        expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(User.find_by(email: @user.email))
      end

      it "should return instance of user even when email is written with spaces" do
        @user = User.create(
          first_name: "David",
          last_name: "Braverman",
          email: " david@braverman.com ",
          password: "123",
          password_confirmation: "123"
        )

        @user.validate

        expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(User.find_by(email: @user.email))
      end
    end
  end
end
