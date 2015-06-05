module Admin
  class SubCategoriesController < ApplicationController
    def index
      load_category
      @sub_categories = @category.sub_categories
    end

    private

    def load_category
      @category = Category.find_by(slug: params[:category_slug])
    end
  end
end
