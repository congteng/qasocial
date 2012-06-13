Coach::Application.routes.draw do
	authenticated :user do
		root :to => 'home#index'
	end

	root :to => "home#index"
	devise_for :users
	
	resources :users, :only => :show do
		resources :schedules
		resources :boards
	end
	resources :home, :only => :index do
		collection do
			get 'plan'
		end
	end

	resources :functionalities
	resources :site_infos, :controller => "manager", :path => "manage"
end
