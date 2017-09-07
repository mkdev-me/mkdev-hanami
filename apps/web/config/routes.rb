get '/session', to: 'session#failure'
get "/auth/:provider/callback", to: "session#new"

get '/', to: 'folders#index'

resources :tickets do
  member do
    post 'export'
  end
end
resources :customers
resources :folders
