Coach::Application.routes.draw do
	authenticated :user do
		root :to => 'home#index'
	end

	root :to => "home#index"
	devise_for :users
	
	resources :users, :only => :show do
		resources :schedules
	end
	resources :home, :only => :index do
		collection do
			get 'plan'
		end
	end

	resources :boards
	resources :functionalities

end
