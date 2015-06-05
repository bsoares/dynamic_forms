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

  describe "'multi_selection?' method" do
    it "returns true if field_type has a value that permits sub options" do
      field = build(:field, field_type: Field.field_types[:select_field])
      expect(field.multi_selection?).to eql true

      field.field_type = Field.field_types[:checkbox_field]
      expect(field.multi_selection?).to eql true
    end

    it "returns false if field_type has a value that do not permits " \
      "sub options" do
      field = build(:field, field_type: Field.field_types[:text_field])
      expect(field.multi_selection?).to eql false

      field.field_type = Field.field_types[:textarea_field]
      expect(field.multi_selection?).to eql false
    end

    it "returns false if field_type is not set" do
      field = build(:field, field_type: nil)
      expect(field.multi_selection?).to eql false
    end
  end
end
