module Admin
  class FormsController < ApplicationController
    before_action :load_categories
    before_action :load_form, only: [:edit, :update, :destroy]

    def index
      @forms = @sub_category.forms
    end

    def new
      @form = @sub_category.forms.build
    end

    def create
      @form = @sub_category.forms.build(form_params)

      if @form.save
        flash[:success] = t(".flash.success")
        redirect_to admin_category_sub_category_forms_path(
          @category, @sub_category)
        return
      end
      flash[:error] = t(".flash.error")
      render :new
    end

    def edit; end

    def update
      if @form.update(form_params)
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end
      render :edit
    end

    def destroy
      if @form.destroy
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end
      redirect_to admin_category_sub_category_forms_url(
        @category, @sub_category)
    end

    private

    def load_categories
      @sub_category = SubCategory.find(params[:sub_category_id])
      @category = @sub_category.category
    end

    def load_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name)
    end
  end
end
