Rails.application.routes.draw do
  get '/new', to:'_games#new'
  post '/score', to:'_games#score'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
