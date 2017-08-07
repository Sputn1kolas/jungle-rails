require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should save with correct info' do
      @user = User.new(
        name: "Joe Clark",
        password_digest: "password",
        email: "joey@gov.ca"
        )
      expect(@user.valid?).to be(true)
      puts @user.errors.messages
    end


  it 'should not save without an email' do
      @user = User.new(
        name: "Joe Clark",
        password_digest: "password"
        )
      expect(@user.valid?).to be(false)
      expect(@user.errors.messages).to eq({:email=>["can't be blank"]})
      puts @user.errors.messages
    end

  it 'should not save without a name' do
    @user = User.new(
      email: "Joe.Clark@gov.ca",
      password_digest: "password"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:name=>["can't be blank"]})
    puts @user.errors.messages
  end

   it 'should not save with non-unique emails' do
    @user1 = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password_digest: "password"
      )
    @user1.save
    @user2 = User.create(
      name: "Joe Clark",
      email: "Joe.ClarK@GOV.ca",
      password_digest: "password"
      )
    expect(@user2.valid?).to be(false)
    expect(@user2.errors.messages).to eq({:email=>["has already been taken"]})
    puts @user2.errors.messages
  end

  it 'should not save with a short password' do
    @user = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password_digest: "p"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:password_digest=>["is too short (minimum is 5 characters)"]})
    puts @user.errors.messages
  end

  it 'should not save with a long password' do
    @user = User.new(
      name: "Joe Clark",
      email: "Joe.Clark@gov.ca",
      password_digest: "passwordpasswordpasswordpasswordpasswordpasswordpasswordpasswordpassword"
      )
    expect(@user.valid?).to be(false)
    expect(@user.errors.messages).to eq({:password_digest=>["is too long (maximum is 20 characters)"]})
    puts @user.errors.messages
  end

end
