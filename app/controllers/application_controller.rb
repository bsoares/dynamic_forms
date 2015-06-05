class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :load_categories_tree

  def load_categories_tree
    @categories_tree = Category.preload(:sub_categories)
  end
end
