RSpec.configure do |config|
  config.before(:example, foo: Proc.new { |value| value.is_a?(String) }) do
    invoked_hooks << :before_example_foo_bar
  end
end

RSpec.describe "a filter before :example hook" do
  let(:invoked_hooks) { [] }

  describe "group with matching metadata" do
    it "does not run the hook" do
      expect(invoked_hooks).to be_empty
    end

    it "does not run the hook if the proc returns false", foo: :bar do
      expect(invoked_hooks).to be_empty
    end

    it "runs the hook if the proc returns true", foo: "bar" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end

  describe "group with matching metadata", foo: "bar" do
    it "runs the hook" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end
end
