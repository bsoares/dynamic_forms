require "rails_helper"

RSpec.feature "Form Build" do
  specify "show a message when there is no registered form" do
    sub_category = create(:sub_category)
    category = sub_category.category

    visit category_sub_category_forms_path(category, sub_category)

    expect(page).to have_content t("forms.build.empty")
  end

  specify "requires forms to be listed" do
    option = create(:option)
    field = option.field
    form = field.form
    sub_category = form.sub_category
    category = sub_category.category

    visit category_sub_category_forms_path(category, sub_category)

    expect(page).to have_content form.name
  end

  specify "requires one of each field_types listed" do
    form = create(:form)
    Field.field_types.each do |type|
      field_type = Field.field_types[type[0]]
      create(:field, field_type: field_type, form: form)
    end
    sub_category = form.sub_category
    category = sub_category.category
    fields = form.fields

    visit category_sub_category_forms_path(category, sub_category)

    fields.each do |field|
      expect(page).to have_content field.name
    end
  end

  specify "requires options listed" do
    option = create(:option)
    field = option.field
    form = field.form
    sub_category = form.sub_category
    category = sub_category.category

    visit category_sub_category_forms_path(category, sub_category)

    expect(page).to have_content option.name
  end
end
