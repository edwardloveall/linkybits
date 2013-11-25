Linkybits::Application.routes.draw do
  root to: "groups#index"

  resources :links
  resources :groups
end
