Rails.application.routes.draw do
  resources :categories do
    resource :comments
    resources :posts do
      resource :comments
    end
  end
end


