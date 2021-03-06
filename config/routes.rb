Rails.application.routes.draw do
  resources :questions
  resources :users
  resources :answers

  root "questions#index"
  get "users" => "users#index"
  get "users/signup" => "users#new"
    get "signup" => "users#new"

  post "users" => "users#create"

  #routes for logging in/out

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get 'users/:id/questions' => 'users#question', as: :user_questions
  post 'users/:id/questions' => 'questions#create'

  get 'questions/:id/answers' => 'questions#answer' 

  post 'questions/:id/answers' => 'answers#answerinsidequestion', as: :question_answers

  get 'questions/:id' => 'questions#show', as: :question_path

  post 'users/:id' => 'users#answer'
  delete 'answer/:id' => 'answers#destroy'

  get 'users/:id/questions/:id' => 'questions#show'

  #post 'questions/:id' => 'questions#answerinsidequestion'

  #delete 'users/:id/questions' => 'users#destroy'

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
