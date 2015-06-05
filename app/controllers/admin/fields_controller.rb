module Admin
  class FieldsController < ApplicationController
    before_action :load_nested_objects
    before_action :load_field, only: [:edit, :update, :destroy]

    def index
      @fields = @form.fields
    end

    def new
      @field = @form.fields.build
    end

    def create
      @field = @form.fields.build(field_params)

      if @field.save
        flash[:success] = t(".flash.success")
        redirect_to admin_category_sub_category_form_fields_path(
          @category, @sub_category, @form)
        return
      end
      flash[:error] = t(".flash.error")
      render :new
    end

    def edit; end

    def update
      if @field.update(field_params)
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end
      render :edit
    end

    def destroy
      if @field.destroy
        flash[:success] = t(".flash.success")
      else
        flash[:error] = t(".flash.error")
      end
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
  end
end
