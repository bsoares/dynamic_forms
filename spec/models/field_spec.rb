require "rails_helper"

RSpec.describe Field do
  subject(:field) { build(:field) }

  describe "Validations" do
    describe "form" do
      it { is_expected.to validate_presence_of(:form) }
    end

    describe "field_type" do
      it { is_expected.to validate_presence_of(:field_type) }
    end

    describe "order" do
      it { is_expected.to validate_presence_of(:order) }
    end

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end
  end
end
