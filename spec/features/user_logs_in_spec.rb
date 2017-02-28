require 'rails_helper'

feature "user visits login path" do
  scenario "logs in" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Submit"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login successful!")
    expect(page).to have_content("Logged in with #{user.email}")
  end

  scenario "logs in with incorrect credentials" do
    user = User.create(email: "test@example.com", password: "password")

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: "wrong_password"
    click_on "Submit"

    expect(page).to have_content("Login unsuccessful!")
  end
end
