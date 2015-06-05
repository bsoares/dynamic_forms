require "rails_helper"

RSpec.feature "Field" do
  context "index" do
    specify "requires fields listed" do
      field = create(:field)
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      click_link t("admin.fields.index.title")

      expect(page).to have_content field.name
    end

    specify "show a message when the list is empty" do
      form = create(:form)
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      click_link t("admin.fields.index.title")

      expect(page).to have_content t("admin.fields.index.flash.empty")
    end

    specify "requires a ordered list (by order attribute)" do
      form = create(:form)
      sub_category = form.sub_category
      category = sub_category.category

      create(:field, form: form, order: 2, name: "Field 2")
      create(:field, form: form, order: 3, name: "Field 3")
      create(:field, form: form, order: 1, name: "Field 1")

      visit admin_category_sub_category_form_fields_path(
        category, sub_category, form)

      expect(page.text).to match(/Field 1.*Field 2.*Field 3/)
    end
  end

  context "create" do
    scenario "with valid input" do
      form = create(:form)
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      click_link t("admin.fields.index.title")

      click_link t("admin.fields.new.title")

      fill_in t("activerecord.attributes.field.name"), with: "xxx"
      select t("field_types.text_field"),
        from: t("activerecord.attributes.field.field_type")
      fill_in t("activerecord.attributes.field.order"), with: 1

      submit_form

      expect(page).to have_content t("admin.fields.create.flash.success")

      created_field = Field.first

      expect(created_field.name).to eql "xxx"
      expect(created_field.field_type).to eql "text_field"
      expect(created_field.order).to eql 1
    end

    scenario "with invalid input" do
      form = create(:form)
      sub_category = form.sub_category
      category = sub_category.category

      visit new_admin_category_sub_category_form_field_path(
        category, sub_category, form)

      fill_in t("activerecord.attributes.field.name"), with: ""
      fill_in t("activerecord.attributes.field.order"), with: ""

      submit_form

      expect(page).to have_content t("admin.fields.create.flash.error")
      expect(Field.all).to be_empty
    end

    def submit_form
      click_button t("helpers.submit.create",
        model: t("activerecord.models.field.one"))
    end
  end

  context "edit" do
    let!(:field) { create(:field) }

    scenario "with valid input" do
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_form_fields_path(
        category, sub_category, form)

      click_link t("admin.fields.edit.title")

      fill_in t("activerecord.attributes.field.name"), with: "xyz"
      select t("field_types.select_field"),
        from: t("activerecord.attributes.field.field_type")
      fill_in t("activerecord.attributes.field.order"), with: 10

      submit_form

      expect(page).to have_content t("admin.fields.update.flash.success")

      updated_field = Field.first

      expect(updated_field.name).to eql "xyz"
      expect(updated_field.field_type).to eql "select_field"
      expect(updated_field.order).to eql 10
    end

    scenario "with invalid input" do
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit edit_admin_category_sub_category_form_field_path(
        category, sub_category, form, field)

      fill_in t("activerecord.attributes.field.name"), with: ""
      fill_in t("activerecord.attributes.field.order"), with: ""

      submit_form

      expect(page).to have_content t("admin.fields.update.flash.error")
    end

    def submit_form
      click_button t("helpers.submit.update",
        model: t("activerecord.models.field.one"))
    end
  end

  context "destroy" do
    let!(:field) { create(:field) }

    scenario "ignoring the confirmation dialog" do
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_form_fields_path(
        category, sub_category, form)

      click_link t("admin.fields.destroy.title")

      expect(page).to have_content t("admin.fields.destroy.flash.success")
      expect(Field.all).to be_empty
    end

    scenario "cancel when the method destroy fails and return false" do
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_form_fields_path(
        category, sub_category, form)

      allow_any_instance_of(Field).to receive(:destroy).and_return(false)

      click_link t("admin.fields.destroy.title")

      expect(page).to have_content t("admin.fields.destroy.flash.error")
      expect(Field.first).to eql field
    end

    scenario "canceling from the browser confirmation dialog", js: true do
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_form_fields_path(
        category, sub_category, form)

      allow_any_instance_of(Field).to receive(:destroy).and_return(false)

      handle_js_confirm false do
        click_link t("admin.fields.destroy.title")
      end

      expect(Field.first).to eql field
    end
  end
end
