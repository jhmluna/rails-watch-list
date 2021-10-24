# frozen-string-literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy

  root to: 'lists#index'
end
