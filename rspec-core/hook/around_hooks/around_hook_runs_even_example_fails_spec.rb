RSpec.describe "something" do
  around(:example) do |example|
    puts "around example setup"
    example.run
    puts "around example cleanup"
  end

  it "still executes the entire around hook" do
    puts "example fails here"  
    fail "the example blows up"
  end
end
