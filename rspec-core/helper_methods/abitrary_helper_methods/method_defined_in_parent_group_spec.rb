RSpec.describe "an example" do
  def help
    :available
  end

  describe "in a nested group" do
    it "has access to methods defined in its parent group" do
      expect(help).to eq(:available)
    end
  end
end
