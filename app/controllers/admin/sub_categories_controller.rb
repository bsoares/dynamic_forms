module Admin
  class SubCategoriesController < AdminController
    include Admin::Breadcrumb

    def index
      load_category

      set_sub_categories

      @sub_categories = @category.sub_categories
    end

    private

    def load_category
      @category = Category.find_by(slug: params[:category_slug])
    end
  end
end
