require "rails_helper"

RSpec.feature "Option" do
  let(:option) { create(:option) }

  context "index" do
    specify "requires fields listed" do
      visit_fields_index(option)

      click_link t("admin.options.index.title")

      expect(page).to have_content option.name
    end

    specify "show a message when the list is empty" do
      visit_fields_index

      click_link t("admin.options.index.title")

      expect(page).to have_content t("admin.options.index.flash.empty")
    end
  end

  context "create" do
    scenario "with valid input" do
      visit_fields_index

      click_link t("admin.options.index.title")

      click_link t("admin.options.new.title")

      fill_in t("activerecord.attributes.field.name"), with: "xxx"

      submit_form

      expect(page).to have_content t("admin.options.create.flash.success")

      created_option = Option.first

      expect(created_option.name).to eql "xxx"
    end

    scenario "with invalid input" do
      field = create(:field)
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit new_admin_category_sub_category_form_field_option_path(
        category, sub_category, form, field)

      fill_in t("activerecord.attributes.field.name"), with: ""

      submit_form

      expect(page).to have_content t("admin.options.create.flash.error")
      expect(Option.all).to be_empty
    end

    def submit_form
      click_button t("helpers.submit.create",
        model: t("activerecord.models.option.one"))
    end
  end

  context "edit" do
    scenario "with valid input" do
      visit_options_index

      click_link t("admin.options.edit.title")

      fill_in t("activerecord.attributes.option.name"), with: "xyz"

      submit_form

      expect(page).to have_content t("admin.options.update.flash.success")

      updated_option = Option.first

      expect(updated_option.name).to eql "xyz"
    end

    scenario "with invalid input" do
      field = option.field
      form = field.form
      sub_category = form.sub_category
      category = sub_category.category

      visit edit_admin_category_sub_category_form_field_option_path(
        category, sub_category, form, field, option)

      fill_in t("activerecord.attributes.option.name"), with: ""

      submit_form

      expect(page).to have_content t("admin.options.update.flash.error")
    end

    def submit_form
      click_button t("helpers.submit.update",
        model: t("activerecord.models.option.one"))
    end
  end

  context "destroy" do
    scenario "ignoring the confirmation dialog" do
      visit_options_index

      click_link t("admin.options.destroy.title")

      expect(page).to have_content t("admin.options.destroy.flash.success")
      expect(Option.all).to be_empty
    end

    scenario "cancel when the method destroy fails and return false" do
      visit_options_index

      allow_any_instance_of(Option).to receive(:destroy).and_return(false)

      click_link t("admin.options.destroy.title")

      expect(page).to have_content t("admin.options.destroy.flash.error")
      expect(Option.first).to eql option
    end

    scenario "canceling from the browser confirmation dialog", js: true do
      visit_options_index

      handle_js_confirm false do
        click_link t("admin.options.destroy.title")
      end

      expect(Option.first).to eql option
    end
  end

  def visit_options_index
    field = option.field
    form = field.form
    sub_category = form.sub_category
    category = sub_category.category

    visit admin_category_sub_category_form_field_options_path(
      category, sub_category, form, field)
  end

  def visit_fields_index(option = nil)
    field = option.nil? ? create(:field) : option.field
    form = field.form
    sub_category = form.sub_category
    category = sub_category.category

    visit admin_category_sub_category_form_fields_path(
      category, sub_category, form)
  end
end
