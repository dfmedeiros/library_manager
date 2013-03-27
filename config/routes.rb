LibraryManager::Application.routes.draw do

  resources :books, :only => :index do
    resources :loans, :only => [:index, :new, :create] do
      member do
        put :replace
      end
    end
  end

  resources :students, :only => [:index, :show]
  
  devise_for :employees, :skip => :registrations

  root :to => 'books#index'
end
