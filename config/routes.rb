Rails.application.routes.draw do


  resources :event_images
  resources :guestlist_details

  resources :guestlists
  resources :simple_sites

  post "/events/event_id" => "events#event_id", :as => 'event_id'

  resources :user_businesses

  get 'address/new'

  get 'Impressum', to: 'simple_sites#impressum', as: 'impressum'
  get 'Datenschutzerklärung', to: 'simple_sites#privacy', as: 'privacy'
  get 'AGB', to: 'simple_sites#agb', as: 'agb'
  get '', to: 'welcomes#index', as: "welcomes"

  resources :events

  resources :branches

  devise_scope :user do
    match '/users/sign_out' => 'devise/sessions#destroy', via: [:get, :delete]
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'Branchen', to: 'branches#index'
  get 'Branche/:name', to: 'branches#show'
  get 'Branche/:name/bearbeiten', to:'branches#edit'
  get 'Branche/neu', to:'branches#new'
  patch 'Branche/:name',to: 'branches#update'


  post 'profiles/:id', to: 'profiles#destroy_photo'
  resources :profiles

  resources :services

  resources :businesses

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root to: 'welcomes#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
