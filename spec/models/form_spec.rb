require "rails_helper"

RSpec.describe Form do
  subject(:form) { build(:form) }

  describe "Validations" do
    describe "sub_category" do
      it { is_expected.to validate_presence_of(:sub_category) }
    end

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end
  end
end
