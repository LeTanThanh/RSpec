RSpec.describe "before and after context run once" do
  before(:context) do
    puts "Outer before context"
  end

  example "Outer example" do
    puts "Outer example runs here"
  end

  describe "Inner group" do
    before(:context) do
      puts "Inner before context"
    end

    example "Inner example" do
      puts "Inner example runs here"
    end

    after(:context) do
      puts "Inner after context"
    end
  end

  after(:context) do
    puts "Outer after context"
  end
end
