require 'rails_helper'

feature "Sign up" do
  before :each do
    visit "/users/new"
  end

  it "has a user sign up page" do
    expect(page).to have_content "Sign Up"
  end


  it "takes a username and password" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  it "logs the user in and redirects them to links index on success" do
    sign_up_as_ginger_baker
    expect(page).to have_content 'ginger_baker'
  end
end

feature "Sign out" do
  it "has a sign out button" do
    sign_up_as_ginger_baker
    expect(page).to have_button 'Sign Out'
  end

end

feature "Sign in" do
  it "has a sign in page" do
    visit "/session/new"
    expect(page).to have_content "Sign In"
  end

  it "takes a username and password" do
    visit "/session/new"
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

end
