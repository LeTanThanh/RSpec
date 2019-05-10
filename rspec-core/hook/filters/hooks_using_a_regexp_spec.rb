RSpec.configure do |config|
  config.before(:example, foo: /bar/) do
    invoked_hooks << :before_example_foo_bar
  end
end

RSpec.describe "a filtered before :example hook" do
  let(:invoked_hooks) { [] }

  describe "group without matching metadata" do
    let(:invoked_hooks) { [] }

    describe "group without matching metadata" do
      it "does not run the hook" do
        expect(invoked_hooks).to be_empty
      end

      it "does not run the hook if the value does nor match", foo: "baz" do
        expect(invoked_hooks).to be_empty
      end
    end
  end

  describe "group with matching metadata", foo: "bar" do
    it "runs the hook" do
      expect(invoked_hooks).to eq([:before_example_foo_bar])
    end
  end
end
