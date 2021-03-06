require "rails_helper"

RSpec.describe "can create links", :js => :true do
  it "Create a new link with valid data" do
    user = User.create(email: "test@example.com", password: "password")
    log_in(user)

    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#link-table-body') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("http://turing.io")
    end
  end

  it "Create a new link without title" do
    user = User.create(email: "test@example.com", password: "password")
    log_in(user)

    fill_in "URL:", :with => "http://turing.io"
    click_on "Add Link"

    within('#link-table-body') do
      expect(page).to_not have_text("http://turing.io")
    end
  end

  it "Create a new link with invalid url" do
    user = User.create(email: "test@example.com", password: "password")
    log_in(user)

    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "turing.com"
    click_on "Add Link"

    within('#link-table-body') do
      expect(page).to_not have_text("Turing")
      expect(page).to_not have_text("turing.com")
    end
  end
end
