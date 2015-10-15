require 'rails_helper'

describe "the add a category process" do

  # before { create_user }

  it "adds a new category" do
    @user = User.create!(
    username: "tkellogg",
    email: "tim.kellogg@gmail.com",
    password: "password!",
    password_confirmation: "password!",
    admin: true
    )
    puts "Here is my email:  #{@user.email}"
    puts "Here is my password:  #{@user.password}"
    visit new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Login'
    # visit /categories/#index
    # save_and_open_page
    # fill_in 'THIS', :with => 'Romance'
    # click_on 'Add category'
    expect(page).to have_content 'Name of new category'
  end

  it "gives error when no name is entered" do
    visit categories_path
    click_on 'commit'
    expect(page).to have_content 'errors'
  end
end


def create_user
  @user = User.create!(
    username: "tkellogg",
    email: "tim.kellogg@gmail.com",
    password: "password!",
    password_confirmation: "password!",
    admin: true
  )
  puts User.count
  sign_in
end

def sign_in
  visit new_user_session_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_on 'Login'
end
