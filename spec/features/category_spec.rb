require "rails_helper"

RSpec.feature "Category" do
  context "index" do
    specify "requires categories listed" do
      category = create(:category)

      visit admin_categories_url

      expect(page).to have_content category.name
    end
  end
end
