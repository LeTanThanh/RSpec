RSpec.describe "If there are multiple around hooks in the same scope" do
  around(:example) do |example|
    puts "1st around hook before"
    example.run
    puts "1st around hook after"
  end

  around(:example) do |example|
    puts "2nd around hook before"
    example.run
    puts "2nd around hook after"
  end

  it "the shoukd all be run" do
    puts "example runs here"
  end
end
