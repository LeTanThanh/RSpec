RSpec.describe "around filter" do
  around(:example) do |example|
    puts "around example before"
    example.run
    puts "around example after"
  end

  before(:example) do
    puts "before example"
  end

  it "gets run in order" do
    puts "example runs here"
  end

  after(:example) do
    puts "after example"
  end
end
