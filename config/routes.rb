Acompishm::Application.routes.draw do
  resources :achievements

	root :to => "page#home"

	devise_for :users, :controllers => { :registrations => 'registrations' }
	
	match "userhome" => "page#userhome", :as => "userhome"
	match '/auth/:provider/callback' => 'authentications#create'

	resources :authentications
end
