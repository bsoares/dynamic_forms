require "rails_helper"

RSpec.describe SubCategory do
  subject(:sub_category) { build(:sub_category) }

  describe "Validations" do
    describe "category" do
      it { is_expected.to validate_presence_of(:category_id) }
    end

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
      it do
        is_expected.to validate_uniqueness_of(:name).scoped_to(:category_id)
      end
    end

    describe "slug" do
      it { is_expected.to validate_presence_of(:slug) }
      it do
        is_expected.to validate_length_of(:slug).is_at_least(1).is_at_most(100)
      end
      it do
        is_expected.to validate_uniqueness_of(:slug).scoped_to(:category_id)
      end
    end
  end
end
