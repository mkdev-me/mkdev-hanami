get '/session', to: 'session#failure'
get "/auth/:provider/callback", to: "session#new"

get '/', to: 'folders#index'

post '/tickets/:id/export', to: 'tickets#export', as: :export_ticket

resources :tickets
resources :customers
resources :folders
