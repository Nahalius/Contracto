Rails.application.routes.draw do

  resources :questions

  resources :surveys

  resources :payments

  resources :invoices


  resources :agreemnts do
    collection do
      get :report

    end
  end
  match '/report',   to: 'agreemnts#report',   via: 'get'

  resources :contacts

  resources :clients

  root                'static_pages#home'
  get                 'static_pages/home'
  get                 'static_pages/help'
  get 'signup'  =>    'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  #get 'inv_pdf'  =>    'invoices/show/show.pdf'

  resources :users
  resources :companies

end
