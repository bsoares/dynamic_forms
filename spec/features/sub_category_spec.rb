require "rails_helper"

RSpec.feature "Sub Category" do
  context "index" do
    specify "requires sub categories listed" do
      sub_category = create(:sub_category)

      visit admin_categories_url

      click_link t("sub_categories.index.title")

      expect(page).to have_content sub_category.name
    end
  end
end
