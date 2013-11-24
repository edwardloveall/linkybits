Linkybits::Application.routes.draw do
  root to: "links#index"

  resources :links
  resources :groups
end
