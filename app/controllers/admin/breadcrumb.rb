module Admin
  module Breadcrumb
    def set_categories
      add_breadcrumb t("admin.categories.index.title"), :admin_categories_path
    end

    def set_category
      set_categories

      add_breadcrumb @category.name
    end

    def set_sub_categories
      set_category

      add_breadcrumb t("admin.sub_categories.index.title"),
        admin_category_sub_categories_path(@category)
    end

    def set_sub_category
      set_sub_categories

      add_breadcrumb @sub_category.name
    end

    def set_forms
      set_sub_category

      add_breadcrumb t("admin.forms.index.title"),
        admin_category_sub_category_forms_path(@category, @sub_category)
    end

    def set_form
      set_forms

      add_breadcrumb @form.name, edit_admin_category_sub_category_form_path(
        @category, @sub_category, @form)
    end

    def set_fields
      set_form

      add_breadcrumb t("admin.fields.index.title"),
        admin_category_sub_category_form_fields_path(
          @category, @sub_category, @form)
    end

    def set_field
      set_fields

      add_breadcrumb @field.name,
        edit_admin_category_sub_category_form_field_path(
          @category, @sub_category, @form, @field)
    end

    def set_options
      set_field

      add_breadcrumb t("admin.options.index.title"),
        admin_category_sub_category_form_field_options_path(
          @category, @sub_category, @form, @field)
    end
  end
end
