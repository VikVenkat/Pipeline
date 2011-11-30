Pipeline::Application.routes.draw do
  get "home/index"

  resources :sites
	match "JT_code" => "sites#jackthreads"
	match "RF_code" => "sites#rubyforge_ex"
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
