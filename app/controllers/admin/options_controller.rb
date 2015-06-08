module Admin
  class OptionsController < AdminController
    include Admin::Breadcrumb

    before_action :load_nested_objects
    before_action :load_option, only: [:edit, :update, :destroy]

    before_action :set_options
    before_action :new_breadcrumb, only: [:new, :create]
    before_action :edit_breadcrumb, only: [:edit, :update]

    def index
      @options = @field.options
    end

    def new
      @option = @field.options.build
    end

    def create
      @option = @field.options.build(option_params)

      success = @option.save

      send_conditional_flash_message(success)

      if success
        redirect_to admin_category_sub_category_form_field_options_path(
          @category, @sub_category, @form, @field)
      else
        render :new
      end
    end

    def edit; end

    def update
      success = @option.update(option_params)

      send_conditional_flash_message(success)

      render :edit
    end

    def destroy
      success = @option.destroy

      send_conditional_flash_message(success)

      redirect_to admin_category_sub_category_form_field_options_path(
        @category, @sub_category, @form, @field)
    end

    private

    def load_nested_objects
      @field = Field.find(params[:field_id])
      @form = @field.form
      @sub_category = @form.sub_category
      @category = @sub_category.category
    end

    def load_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:name)
    end

    def new_breadcrumb
      add_breadcrumb t("admin.options.new.title"),
        new_admin_category_sub_category_form_field_option_path(
          @category, @sub_category, @form, @field)
    end

    def edit_breadcrumb
      add_breadcrumb t("admin.options.edit.title"),
        edit_admin_category_sub_category_form_field_option_path(
          @category, @sub_category, @form, @field, @option)
    end
  end
end
