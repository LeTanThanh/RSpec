RSpec.configure do |config|
  config.before(:example, :before_example) { puts "before example" }
  config.after(:example, :after_example) { puts "after example" }
  config.around(:example, :around_example) do |example|
    puts "around example before"
    example.run
    puts "around example after"
  end

  config.before(:context, :before_context) { puts "before context" }
  config.after(:context, :after_context) { puts "after context" }
end

RSpec.describe "group 1", :before_context, :after_context do
  it("") { puts "example 1" }
  it("", :before_example) { puts "example 2" }
  it("", :after_example) { puts "example 3" }
  it("", :around_example) { puts "example 4" }
end
