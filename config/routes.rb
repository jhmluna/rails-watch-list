Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i[index show new create] do # idem to resources :lists, except: %i[edit update destroy]
    resources :bookmarks, only: %i[new create delete]
  end

  root to: 'lists#index'
end
