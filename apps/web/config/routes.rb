get '/session', to: 'session#failure'
get "/auth/:provider/callback", to: "session#new"

get '/', to: 'folders#index'

resources :tickets
resources :customers
resources :folders
