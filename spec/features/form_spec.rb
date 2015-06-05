require "rails_helper"

RSpec.feature "Form" do
  context "index" do
    specify "requires forms listed" do
      form = create(:form)

      visit admin_category_sub_categories_path(form.sub_category.category)

      click_link t("admin.forms.index.title")

      expect(page).to have_content form.name
    end

    specify "show a message when the list is empty" do
      sub_category = create(:sub_category)

      visit admin_category_sub_categories_path(sub_category.category)

      click_link t("admin.forms.index.title")

      expect(page).to have_content t("admin.forms.index.flash.empty")
    end
  end

  context "create" do
    scenario "with valid input" do
      sub_category = create(:sub_category)

      visit admin_category_sub_categories_path(sub_category.category)

      click_link t("admin.forms.index.title")

      click_link t("admin.forms.new.title")

      name = "xxx"
      fill_in t("activerecord.attributes.form.name"), with: name

      submit_form

      expect(page).to have_content t("admin.forms.create.flash.success")

      created_form = Form.first

      expect(created_form.sub_category_id).to eql sub_category.id
      expect(created_form.name).to eql name
    end

    scenario "with invalid input" do
      sub_category = create(:sub_category)

      visit admin_category_sub_categories_path(sub_category.category)

      click_link t("admin.forms.index.title")

      click_link t("admin.forms.new.title")

      fill_in t("activerecord.attributes.form.name"), with: ""

      submit_form

      expect(page).to have_content t("admin.forms.create.flash.error")
    end

    def submit_form
      click_button t("helpers.submit.create",
        model: t("activerecord.models.form.one"))
    end
  end

  context "edit" do
    let!(:form) { create(:form) }

    scenario "with valid input" do
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      click_link t("admin.forms.edit.title")

      name = "xyz"
      fill_in t("activerecord.attributes.form.name"), with: name

      submit_form

      expect(page).to have_content t("admin.forms.update.flash.success")

      updated_form = Form.first

      expect(updated_form.name).to eql name
    end

    scenario "with invalid input" do
      sub_category = form.sub_category
      category = sub_category.category

      visit edit_admin_category_sub_category_form_path(
        category, sub_category, form)

      fill_in t("activerecord.attributes.form.name"), with: ""

      submit_form

      expect(page).to have_content t("admin.forms.update.flash.error")
    end

    def submit_form
      click_button t("helpers.submit.update",
        model: t("activerecord.models.form.one"))
    end
  end

  context "destroy" do
    let!(:form) { create(:form) }

    scenario "ignoring the confirmation dialog" do
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      click_link t("admin.forms.destroy.title")

      expect(page).to have_content t("admin.forms.destroy.flash.success")
      expect(Form.all).to be_empty
    end

    scenario "cancel when the method destroy fails and return false" do
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      allow_any_instance_of(Form).to receive(:destroy).and_return(false)

      click_link t("admin.forms.destroy.title")

      expect(page).to have_content t("admin.forms.destroy.flash.error")
      expect(Form.first).to eql form
    end

    scenario "canceling from the browser confirmation dialog", js: true do
      sub_category = form.sub_category
      category = sub_category.category

      visit admin_category_sub_category_forms_path(category, sub_category)

      handle_js_confirm false do
        click_link t("admin.forms.destroy.title")
      end

      expect(Form.first).to eql form
    end

    def handle_js_confirm(accept = true)
      page.evaluate_script "window.original_confirm_function = window.confirm"
      page.evaluate_script "window.confirm = " \
        "function(msg) { return #{accept}; }"
      yield
      page.evaluate_script "window.confirm = window.original_confirm_function"
    end
  end
end
