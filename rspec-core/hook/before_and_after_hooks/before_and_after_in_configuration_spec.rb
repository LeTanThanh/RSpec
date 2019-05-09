RSpec.configure do |config|
  config.before(:context) do
    @before_context = "before context"
  end

  config.before(:example) do
    @before_example = "before example"
  end
end

RSpec.describe "stuff in before blocks" do
  describe "with :context" do
    it "should be available in the example" do
      expect(@before_context).to eq("before context")
    end
  end

  describe "with :example" do
    it "should be available in the example" do
      expect(@before_example).to eq("before example")
    end
  end
end
