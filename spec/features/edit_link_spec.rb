require "rails_helper"

RSpec.describe "can edit links", :js => :true do
  scenario "Edit link with valid data" do
    user = User.create(email: "test@example.com", password: "password")
    user.links.create(title: "Turing", url: "http://turing.io")
    log_in(user)
    save_and_open_page
    click_on "Edit"

    # within('#links-list') do
    #   expect(page).to have_text("Turing")
    #   expect(page).to have_text("http://turing.io")
    # end
  end
end
#
#   scenario "Create a new link without title" do
#     user = User.create(email: "test@example.com", password: "password")
#     log_in(user)
#
#     fill_in "URL:", :with => "http://turing.io"
#     click_on "Add Link"
#
#     within('#links-list') do
#       expect(page).to_not have_text("http://turing.io")
#     end
#   end
#
#   scenario "Create a new link with invalid url" do
#     user = User.create(email: "test@example.com", password: "password")
#     log_in(user)
#
#     fill_in "Title:", :with => "Turing"
#     fill_in "URL:", :with => "turing.com"
#     click_on "Add Link"
#
#     within('#links-list') do
#       expect(page).to_not have_text("Turing")
#       expect(page).to_not have_text("turing.com")
#     end
#   end
# end
