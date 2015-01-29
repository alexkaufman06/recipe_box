require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

post('/') do
  name = params.fetch("recipe_name")
  Recipe.create({:name => name})
  redirect('/')
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  @recipes = Recipe.all()
  erb(:recipe)
end

post('/recipe/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i())
  recipe_instructions = params.fetch("recipe_instructions")
  @recipe.update({:instructions => recipe_instructions})
  erb(:recipe)
end

patch('/recipe/:id') do
  @recipes = Recipe.all()
  @recipe = Recipe.find(params.fetch("id").to_i())
  new_instructions = params.fetch("new_instructions")
  @recipe.update({:instructions => new_instructions})
  erb(:recipe)
end
