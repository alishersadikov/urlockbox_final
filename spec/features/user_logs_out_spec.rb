require 'rails_helper'

feature "user clicks log out" do
  scenario "user is logged out" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Submit"

    expect(page).to have_content("Log out")
    click_on "Log out"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("Log out")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Log in")
  end
end
