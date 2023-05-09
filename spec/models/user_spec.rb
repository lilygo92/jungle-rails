require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations - Registration" do

    it "registers a user if all the correct fields are present" do
      expect {
        User.create!(first_name: "Lily", last_name: "Go", email: "a@a.com", password: "password", password_confirmation: "password")
      }.to change { User.count }
    end

  context "Password" do

    it "gives appropriate error if password confirmation is not present" do
      @user = User.create(first_name: "Lily", last_name: "Go", email: "a@a.com", password: "password")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Password confirmation can't be blank")
    end

    it "gives appropriate error if password confirmation does not match password" do
      @user = User.create(first_name: "Lily", last_name: "Go", email: "a@a.com", password: "password", password_confirmation: "paswordd")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end

    it "gives appropriate error if password is less than 8 characters" do
      @user = User.create(first_name: "Lily", last_name: "Go", email: 'a@a.com', password: "passwor", password_confirmation: "passwor")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Password is too short (minimum is 8 characters)")
    end

  end

  context "Email" do 

    it "gives appropriate error if email not present" do
      @user = User.create(first_name: "Lily", last_name: "Go", email: nil, password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Email can't be blank")
    end

    it "gives appropriate error if email already exists (not case sensitive)" do
      User.create(first_name: "Jay", last_name: "B", email: "a@a.com", password: "password", password_confirmation: "password")
      @user = User.create(first_name: "Lily", last_name: "Go", email: "a@a.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Email has already been taken")
    end
  end

    it "gives appropriate error if last name not present" do
      @user = User.create(first_name: "Lily", last_name: nil, email: 'a@a.com', password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("Last name can't be blank")
    end

    it "gives appropriate error if first name not present" do
      @user = User.create(first_name: nil, last_name: "Go", email: 'a@a.com', password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to_not be_empty
      expect(@user.errors.full_messages[0]).to eql("First name can't be blank")
    end
  end

  describe ".authenticate_with_credentials" do 

    before do 
      User.create!(first_name: "Lily", last_name: "Go", email: "a@a.com", password: "password", password_confirmation: "password")
    end

    it "returns the correct user object given the needed information" do
      expect(User.authenticate_with_credentials("a@a.com", "password")).to eql(User.last)
    end

    it "returns nil if the email is not found" do
      expect(User.authenticate_with_credentials("b@b.com", "password")).to be_nil
    end

    it "returns nil if the password is incorrect" do
      expect(User.authenticate_with_credentials("a@a.com", "passwor")).to be_nil
    end

    it "returns the user if there is extra whitespace around the email and the password is correct" do
      expect(User.authenticate_with_credentials(" a@a.com ", "password")).to eql(User.last)
    end

    it "returns the user if there the capitalization of the email is different than in the database, and the password is correct" do
      expect(User.authenticate_with_credentials("a@a.com", "password")).to eql(User.last)
    end

  end
end