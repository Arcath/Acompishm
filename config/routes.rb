Acompishm::Application.routes.draw do
	root :to => "page#home"

	devise_for :users
	
	match "userhome" => "page#userhome", :as => "userhome"
end