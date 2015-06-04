Rails.application.routes.draw do
  root to: redirect("/admin/categories")

  scope :admin, module: :admin, as: :admin do
    resources :categories, only: :index do
      resources :sub_categories, only: :index
    end
  end
end
