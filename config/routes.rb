Rails.application.routes.draw do
  resources :categories do
    collection do
      post :create_manual
      delete :delete_manual
      get :select_category
      get :search_manual
    end
  end
end
