require "rails_helper"

RSpec.describe Category do
  subject(:category) { build(:category) }

  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
      it { is_expected.to validate_uniqueness_of(:name) }
    end
  end
end
