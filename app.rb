require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get '/' do
  @recipes = Recipe.all
  @recipe = Recipe.new
  erb :index
end

post '/' do
  @recipes = Recipe.all
  recipe_name = params.fetch("recipe_name")
  @recipe = Recipe.create(:name => recipe_name)
  erb :index
end

get '/recipe/:id' do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipes = Recipe.all
  erb :recipe
end

post '/recipe/:id' do
  @recipe = Recipe.find(params.fetch("id").to_i)
  recipe_instructions = params.fetch("recipe_instructions")
  @recipe.update(:instructions => recipe_instructions)
  erb :recipe
end

post '/recipe/ingredient/:id' do
  @recipe = Recipe.find(params.fetch("id").to_i)
  ingredient_id = params.fetch("ingredient_id")
  ingredient = Ingredient.find(ingredient_id)
  @recipe.ingredients.push(ingredient)
  url = "/recipe/" + params.fetch('id')
  redirect url
end

patch '/recipe/:id' do
  @recipes = Recipe.all
  @recipe = Recipe.find(params.fetch("id").to_i)
  new_instructions = params.fetch("new_instructions")
  @recipe.update(:instructions => new_instructions)
  erb :recipe
end

get "/recipe/delete/:id" do
  to_destroy_recipe = Recipe.find(params.fetch('id').to_i)
  to_destroy_recipe.destroy
  @recipes = Recipe.all
  redirect '/'
end

get "/ingredients" do
  @ingredients = Ingredient.all
  erb :ingredients
end

post "/ingredients" do
  ingredient_name = params.fetch('ingredient_name')
  Ingredient.create(:name => ingredient_name)
  redirect '/ingredients'
end

get "/ingredients/delete/:id" do
  to_destroy_ingredient = Ingredient.find(params.fetch('id').to_i)
  to_destroy_ingredient.destroy
  redirect '/ingredients'
end
