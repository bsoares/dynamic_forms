require "rails_helper"

RSpec.describe Category do
  it_behaves_like "slugable"

  subject(:category) { build(:category) }

  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_uniqueness_of(:name) }
    end

    describe "slug" do
      it { is_expected.to validate_uniqueness_of(:slug) }
    end
  end

  describe "to_param" do
    it "returns the slug instead of the id" do
      category = create(:category)

      expect(category.to_param).to eql category.slug
    end
  end
end
