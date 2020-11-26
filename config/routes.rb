Rails.application.routes.draw do
	resources :game_sessions
	resources :players
	resources :wands
	resources :durations
	resources :effects
	devise_for :users, :controllers => { registrations: 'registrations' }
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/settings' => 'statics#user_settings'
	get '/sessions' => 'game_sessions#my_sessions'
	get '/dm' => 'statics#dm_page'
	get '/p' => 'statics#player_page'
	root 'statics#dashboard'
end
