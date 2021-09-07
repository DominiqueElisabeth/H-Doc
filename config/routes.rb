Rails.application.routes.draw do
  resources :appointments
  resources :posts

  root 'tops#index'
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/guest_admin_sign_in', to: 'tops#guest_admin_sign_in'

  devise_for :patients, controllers: {
    sessions:      'patients/sessions',
    passwords:     'patients/passwords',
    registrations: 'patients/registrations'
  }
  resources :patients

  devise_for :doctors, controllers: {
    sessions:      'doctors/sessions',
    passwords:     'doctors/passwords',
    registrations: 'doctors/registrations'
  }
  resources :doctors, except: [:show]

  resources :posts do
    resources :appointments, only: :update, controller: 'posts/appointments'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
