require "rails_helper"

RSpec.shared_examples "slugable" do
  describe "Validations" do
    describe "name" do
      it { is_expected.to validate_presence_of(:name) }
      it do
        is_expected.to validate_length_of(:name).is_at_least(1).is_at_most(100)
      end
    end

    describe "slug" do
      it { is_expected.to validate_presence_of(:slug) }
      it do
        is_expected.to validate_length_of(:slug).is_at_least(1).is_at_most(100)
      end
    end
  end
end
