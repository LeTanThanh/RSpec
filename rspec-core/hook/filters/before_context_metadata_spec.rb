RSpec.configure do |config|
  config.before(:example, foo: :bar) do
    @hook = :before_context_foo_bar
  end
end

RSpec.describe "a filtered before(:context) hook" do
  describe "a group without matching metadata" do
    it "does not run the hook" do
      expect(@hook).to be_nil
    end

    it "runs the hook for a single example with matching metadata", foo: :bar do
      expect(@hook).to eq(:before_context_foo_bar)
    end
  end

  describe "a group with matching metadata", foo: :bar do
    it "runs the hook" do
      expect(@hook).to eq(:before_context_foo_bar)
    end

    describe "a nested subgroup" do
      it "runs the hook" do
        expect(@hook).to eq(:before_context_foo_bar)
      end
    end
  end
end
