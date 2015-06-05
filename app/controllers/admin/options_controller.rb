module Admin
  class OptionsController < ApplicationController
    before_action :load_nested_objects
    before_action :load_option, only: [:edit, :update, :destroy]

    def index
      @options = @field.options
    end

    def new
      @option = @field.options.build
    end

    def create
      @option = @field.options.build(option_params)

      if @option.save
        flash[:success] = t(".flash.success")
        redirect_to admin_category_sub_category_form_field_options_path(
          @category, @sub_category, @form, @field)
        return
      end

      flash[:error] = t(".flash.error")
      render :new
    end

    def edit; end

    def update
      if @option.update(option_params)
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end

      render :edit
    end

    def destroy
      if @option.destroy
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end

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
  end
end
