RSpec.configure do |config|
  config.before(:example, foo: { bar: :baz , slow: true }) do
    invoked_hooks << :before_example_foo_bar
  end
end

RSpec.describe "a filtered before :example hook" do
  let(:invoked_hooks) { [] }

  describe "group without matching metadata" do
    it "does not run the hook" do
      expect(invoked_hooks).to be_empty
    end

    it "does not run the hook for an example if only part of the filter matches", foo: { bar: :baz } do
      expect(invoked_hooks).to be_empty
    end

    it "runs the hook for an example if the metadata contains all key value pairs from the filter", foo: { bar: :baz , slow: true, extra: :pair } do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end     
  end

  describe "group with matching metadata", foo: { bar: :baz , slow: true } do
    it "runs the hook" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end
end
