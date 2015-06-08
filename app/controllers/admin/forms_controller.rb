module Admin
  class FormsController < AdminController
    include Admin::Breadcrumb

    before_action :load_categories
    before_action :load_form, only: [:edit, :update, :destroy]

    before_action :set_forms
    before_action :new_breadcrumb, only: [:new, :create]
    before_action :edit_breadcrumb, only: [:edit, :update]

    def index
      @forms = @sub_category.forms
    end

    def new
      @form = @sub_category.forms.build
    end

    def create
      @form = @sub_category.forms.build(form_params)

      success = @form.save

      send_conditional_flash_message(success)

      if success
        redirect_to admin_category_sub_category_forms_path(
          @category, @sub_category)
      else
        render :new
      end
    end

    def edit; end

    def update
      success = @form.update(form_params)

      send_conditional_flash_message(success)

      render :edit
    end

    def destroy
      success = @form.destroy

      send_conditional_flash_message(success)

      redirect_to admin_category_sub_category_forms_url(
        @category, @sub_category)
    end

    private

    def load_categories
      @sub_category = SubCategory.find_by(slug: params[:sub_category_slug])
      @category = @sub_category.category
    end

    def load_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name)
    end

    def new_breadcrumb
      add_breadcrumb t("admin.forms.new.title"),
        new_admin_category_sub_category_form_path(@category, @sub_category)
    end

    def edit_breadcrumb
      add_breadcrumb t("admin.forms.edit.title"),
        edit_admin_category_sub_category_form_path(
          @category, @sub_category, @form)
    end
  end
end
