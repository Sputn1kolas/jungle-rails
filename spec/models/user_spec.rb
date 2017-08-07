require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should save with correct info' do
      @user = User.new(
        name: "Joe Clark",
        password: "password",
        password_confirmation: "password",
        email: "joey@gov.ca"
        )
      expect(@user.valid?).to be(true)
      puts @user.errors.messages
    end


  it 'should not save without an email' do
      @user = User.new(
        name: "Joe Clark",
        password: "password"
        )
      expect(@user.valid?).to be(false)
      expect(@user.errors.messages).to eq({:email=>["can't be blank"]})
      puts @user.errors.messages
    end

  it 'should not save without a name' do
    @user = User.new(
      email: "Joe.Clark@gov.ca",
      password: "password"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:name=>["can't be blank"]})
    puts @user.errors.messages
  end

   it 'should not save with non-unique emails' do
    @user1 = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password: "password"
      )
    @user1.save
    @user2 = User.create(
      name: "Joe Clark",
      email: "Joe.ClarK@GOV.ca",
      password: "password"
      )
    expect(@user2.valid?).to be(false)
    expect(@user2.errors.messages).to eq({:email=>["has already been taken"]})
    puts @user2.errors.messages
  end

  it 'should not save with a short password' do
    @user = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password: "p"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:password=>["is too short (minimum is 5 characters)"]})
    puts @user.errors.messages
  end

  it 'should not save with a long password' do
    @user = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password: "passwordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpassword"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:password=>["is too long (maximum is 20 characters)"]})
    puts @user.errors.messages
  end

  it 'should not save if password and password confirmation do not match' do
    @user = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password: "password",
      password_confirmation: "not_the_same"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:password_confirmation=>["doesn't match Password"]})
    puts @user.errors.messages
  end

end
