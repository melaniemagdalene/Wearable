Rails.application.routes.draw do
	devise_for :users

	root   'static_pages#home'
	get    '/about',   to: 'static_pages#about'
	get    '/contact', to: 'static_pages#contact'
	# get    '/signup',  to: 'users#new'

	# get    '/help',    to: 'static_pages#help'
	# get    '/posts/new', to: 'static_pages#posts', as: :posts
	post    '/posts/:post_id/comments', to: 'comments#create', as: :comments
	resources :posts do 
		resources :comments
	end
end
