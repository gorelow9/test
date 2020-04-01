Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'departments#index' 
  resources :employees, only: [:new, :create, :edit, :update, :index] 
  resources :departments, only: [:new, :create, :edit, :update, :index] 
  resources :bounds, only: [:new, :create]
  get 'report', to: 'departments#report', as: 'department_report'
  get '/departments/:id', to: 'departments#change_name', as: 'department_change_name'
end
