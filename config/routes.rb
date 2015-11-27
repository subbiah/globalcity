Rails.application.routes.draw do
  
  resources :messages

  resources :eventimages

  resources :events

  resources :bill_statuses do
    collection { post :import }
  end

  resources :flats

  resources :imageuploads
  
  resources :important_contacts

  resources :images

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :gclife_registration_flatdetails

  resources :gclife_registrations

  resources :society_member_masters

  resources :role_types

  resources :member_types

  resources :building_masters

  resources :society_masters

  resources :association_masters

  resources :township_masters

  get 'ImportBill'  => 'bill_statuses#import_excel'
  get 'association'  => 'association_masters#all_association'
  
  get 'view_bill' => 'bill_statuses#view_bill'
  
   get 'my_bill' => 'bill_statuses#my_bill'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'gclife_registrations#index'

  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
    get "sign_out", :to => "devise/sessions#destroy"
    get "verify_account", :to => "devise/registrations#verify_account"
    get "resend_otp", :to => "devise/registrations#resend_otp"
    get "get_registered_users", :to => "devise/registrations#get_registered_users"
    get "activate_users", :to => "devise/registrations#activate_users"
    get "user_details", :to => "devise/registrations#user_details"
    get "search_users", :to => "devise/registrations#search_users"
    get "all_users", :to => "devise/registrations#all_users"
  end

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
