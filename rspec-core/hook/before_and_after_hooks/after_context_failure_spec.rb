RSpec.describe "Error in after(:context)" do
  after(:context) do
    raise StandardError.new("Boom !")
  end

  it "passes 1st example" do
  end

  it "passes 2nd example" do
  end
end
