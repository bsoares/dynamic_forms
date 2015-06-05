class FormsController < ApplicationController
  before_action :load_nested_objects

  def build; end

  def load_nested_objects
    @sub_category = SubCategory.preload_options.find_by(
      slug: params[:sub_category_slug])
    @category = @sub_category.category
    @forms = @sub_category.forms
  end
end
