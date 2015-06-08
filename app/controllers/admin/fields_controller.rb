module Admin
  class FieldsController < AdminController
    include Admin::Breadcrumb

    before_action :load_nested_objects
    before_action :load_field, only: [:edit, :update, :destroy]

    before_action :set_fields
    before_action :new_breadcrumb, only: [:new, :create]
    before_action :edit_breadcrumb, only: [:edit, :update]

    def index
      @fields = @form.fields.ordered
    end

    def new
      @field = @form.fields.build
    end

    def create
      @field = @form.fields.build(field_params)

      success = @field.save

      send_conditional_flash_message(success)

      if success
        redirect_to admin_category_sub_category_form_fields_path(
          @category, @sub_category, @form)
      else
        render :new
      end
    end

    def edit; end

    def update
      success = @field.update(field_params)

      send_conditional_flash_message(success)

      render :edit
    end

    def destroy
      success = @field.destroy

      send_conditional_flash_message(success)

      redirect_to admin_category_sub_category_form_fields_path(
        @category, @sub_category, @form)
    end

    private

    def load_nested_objects
      @form = Form.find(params[:form_id])
      @sub_category = @form.sub_category
      @category = @sub_category.category
    end

    def load_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:field_type, :order, :name)
    end

    def new_breadcrumb
      add_breadcrumb t("admin.fields.new.title"),
        new_admin_category_sub_category_form_field_path(
          @category, @sub_category, @form)
    end

    def edit_breadcrumb
      add_breadcrumb t("admin.fields.edit.title"),
        edit_admin_category_sub_category_form_field_path(
          @category, @sub_category, @form, @field)
    end
  end
end
