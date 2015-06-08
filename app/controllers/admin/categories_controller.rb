module Admin
  class CategoriesController < AdminController
    include Admin::Breadcrumb

    def index
      set_categories

      @categories = Category.all
    end
  end
end
