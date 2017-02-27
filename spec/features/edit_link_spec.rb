require "rails_helper"

RSpec.describe "can edit links", :js => :true do
  scenario "Edit link with a new title" do
    user = User.create(email: "test@example.com", password: "password")
    user.links.create(title: "Turing", url: "http://turing.io")
    log_in(user)

    element = find('td.link-title')
    element.set("Turingggggg")
    page.find("body").click

    expect(page).to have_content("Turingggggg")
  end

  scenario "Edit link with an invalid url" do
    user = User.create(email: "test@example.com", password: "password")
    user.links.create(title: "Turing", url: "http://turing.io")
    log_in(user)
    element = find('td.link-url')
    element.set("turing")
    page.find("body").click

    expect(Link.last.url).to_not eq("turing")
    expect(Link.last.url).to eq("http://turing.io")
  end
end
