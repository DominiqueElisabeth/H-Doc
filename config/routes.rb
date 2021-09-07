Rails.application.routes.draw do
  root 'tops#index'
  post '/tops/guest_sign_in', to: 'tops#guest_sign_in'
  post '/tops/guest_admin_sign_in', to: 'tops#guest_admin_sign_in'

  devise_for :patients, controllers: {
    sessions:      'patients/sessions',
    passwords:     'patients/passwords',
    registrations: 'patients/registrations'
  }
  resources :patients

  devise_for :staffs, controllers: {
    sessions:      'staffs/sessions',
    passwords:     'staffs/passwords',
    registrations: 'staffs/registrations'
  }
  resources :staffs, except: [:show]

  resources :health_interviews do
    resources :guide_statuses, only: :update, controller: 'health_interviews/guide_statuses'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
