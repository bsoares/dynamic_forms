require "rails_helper"

RSpec.describe Option do
  subject(:option) { build(:option) }

  describe "Validations" do
    describe "field" do
      it { is_expected.to validate_presence_of(:field) }
    end

    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end
  end
end
