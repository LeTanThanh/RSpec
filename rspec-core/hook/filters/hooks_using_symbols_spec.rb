RSpec.configure do |config|
  config.before(:example, :foo) do
    invoked_hooks << :before_example_foo_bar
  end
end

RSpec.describe "a filter before :example hook" do
  let(:invoked_hooks) { [] }

  describe "group without a matching metadata key" do
    it "does not run the hook" do
      expect(invoked_hooks).to be_empty
    end

    it "does not run the hook for an example with metadata hash containing the key with a falsey value", foo: nil do
      expect(invoked_hooks).to be_empty
    end

    it "runs the hook for an example with metadata hash containing the key with a truthy value", foo: :bar do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end

    it "runs the hook for an example with only the key defined", :foo do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end

  describe "group with matching metadata key", :foo do
    it "runs the hook" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end 
  end
end
