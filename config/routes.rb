Rails.application.routes.draw do
  resources :book_copies, only: %i[create update]
end
