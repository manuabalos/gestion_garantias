# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match 'gestion_garantias', to: 'gg_providers#index', as: 'gg_home'
resources :providers