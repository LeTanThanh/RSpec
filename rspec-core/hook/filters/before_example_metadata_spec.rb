RSpec.configure do |config|
  config.before(:example, foo: :bar) do
    invoked_hooks << :before_example_foo_bar
  end
end

RSpec.describe "a filtered before :example hooks" do
  let(:invoked_hooks) { [] }
  let(:demo) { "abc" }

  describe "group without matching metadata" do
    it "does nor tun the hook" do
      expect(invoked_hooks).to be_empty
    end
    
    it "runs the hook for an example with matching metadaya", foo: :bar do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end

  describe "group with matching metadata", foo: :bar do
    it "runs the hook" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end
end
