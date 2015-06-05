require "rails_helper"

RSpec.describe "MonthAttendanceDecorator" do
  let(:field) { build(:field).decorate }

  context "field_type_translated" do
    specify "returns field type translated" do
      Field.field_types.each do |field_type|
        field.field_type = Field.field_types[field_type]
        expect(field.field_type_translated).to eql(
          t("field_types.#{field.field_type}"))
      end
    end
  end
end
