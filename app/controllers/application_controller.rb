require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do
    
    @recipes = Recipe.all

    erb :index
  end

  get '/recipes/new' do

    erb :new

  end

  get '/recipes/:id' do

    @recipe = Recipe.find(params[:id])

    erb :show
  end

  post '/recipes' do
    r = Recipe.create(params)

    redirect "recipes/#{r.id}"

  end

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do

    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.save

    redirect "/recipes/#{@recipe.id}"

  end

  

end
