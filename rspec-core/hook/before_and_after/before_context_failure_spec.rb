RSpec.describe "an error in before(:context)" do
  before(:context) do
    raise "Error in before(:context)"
  end

  it "fails 1st example" do
  end

  it "fails 2nd example" do
  end

  describe "nested group" do
    it "fails 3rd example" do
    end

    it "fails 4th example" do
    end

    describe "yet another level deep" do
      it "fails last example"
    end
  end

  after(:context) do
    puts "It runs after(:context)"
  end
end
