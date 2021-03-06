require "rails_helper"

RSpec.describe SubCategory do
  it_behaves_like "slugable"

  subject(:sub_category) { build(:sub_category) }

  describe "Validations" do
    describe "category" do
      it { is_expected.to validate_presence_of(:category_id) }
    end

    describe "name" do
      it do
        is_expected.to validate_uniqueness_of(:name).scoped_to(:category_id)
      end
    end

    describe "slug" do
      it do
        is_expected.to validate_uniqueness_of(:slug).scoped_to(:category_id)
      end
    end
  end

  describe "to_param" do
    it "returns the slug instead of the id" do
      sub_category = create(:sub_category)

      expect(sub_category.to_param).to eql sub_category.slug
    end
  end
end
