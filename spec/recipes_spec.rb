require("spec_helper")

describe(Recipe) do
  it { should have_and_belong_to_many(:ingredients) }
  it { should have_and_belong_to_many(:categories) }
  # The above two lines are specs for 'associations'

  it("capitalizes the recipe name before initializaion") do
    test_recipe = Recipe.create(:name => "quiche")
    expect(test_recipe.name).to(eq("Quiche"))
    # Above is a spec for a 'callback'
  end

  it("validates the presence of a name") do
    test_recipe = Recipe.new(:name => "")
    expect(test_recipe.save).to(eq(false))
    # Above is a spec for a 'validation'
  end
end
