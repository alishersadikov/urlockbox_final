require 'rails_helper'

RSpec.describe Read, type: :model do
  describe "relationships" do
    link = Link.create(title: "test", url: "https://github.com")
    read = Read.new(link_id: link.id)

    it "belongs to a link" do
      expect(read).to respond_to(:link)
    end
  end
end
