Rails.application.routes.draw do
  use_doorkeeper
  mount Base => '/'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end
  root "courses#index"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  #get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'add_teachers/index'
  get 'add_teachers/edit'
  get 'students/index'
  get 'students/show'
  get 'students/:id/new' => 'students#new', :as => :new_student
  get 'students/edit'
  get 'students/delete'
  get 'teachers/index'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'users/delete'
  get 'user/index'
  get 'user/show'
  get 'user/new'
  get 'user/edit'
  get 'user/delete'
  get 'departments/index'
  get 'departments/show'
  get 'departments/new'
  get 'departments/edit'
  get 'departments/delete'
  get 'courses/:course_id/students/:student_id/unenroll', to: 'students#unenroll', :as => :unenroll
  get 'student/:id/assign_department', to: 'students#assign_department', :as => :assign_department
  get 'users/:id/unassign_head', to: 'users#unassign_head', :as => :unassign_head
  #get 'courses/index'
  #get 'courses/show'
  #get 'courses/new'
  #get 'courses/edit'
  #get 'courses/delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get "/courses", to: "courses#index"
  # get "/articles/:id", to: "articles#show"
  #get "/course/:id", to: "course#show"
  #get '/courses/:id', to: 'courses#show'


get 'teachers/filter_teachers', to: 'teachers#filter_teachers'

  resources :courses

  resources :departments

  resources :users do
    get :department_head, on: :member
  end
  resources :teachers

  resources :students




  resources :add_teachers


end
