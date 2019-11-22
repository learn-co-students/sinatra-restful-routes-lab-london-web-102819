class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/?' do

    redirect to '/recipes'
  end 


  get '/recipes' do
    @recipes=Recipe.all 
    erb :index
  end 


  get '/recipes/new' do
    @recipe = Recipe.new 
    erb :new 
  end

  post '/recipes/?'do
    @recipe=Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id'do
    id = params[:id]
    # binding.pry
    @recipe=Recipe.find(id)
    erb :show 
  end 

  get '/recipes/:id/edit' do
    id = params[:id]
    @recipe=Recipe.find(id)

    erb :edit 
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    # binding.pry
    @recipe.name=params[:name]
    @recipe.ingredients=params[:ingredients]
    @recipe.cook_time=params[:cook_time]
    @recipe.save 
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    redirect to '/recipes'
  end

end
