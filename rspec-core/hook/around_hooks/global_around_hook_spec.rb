RSpec.configure do |config|
  config.around(:example) do |example|
    puts "around example setup"
    example.run
    puts "around example cleanup"
  end
end

RSpec.describe "around filter" do
  it "gets run in order" do
    puts "example runs here"
  end
end
