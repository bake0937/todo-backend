Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :todos
  end
end
