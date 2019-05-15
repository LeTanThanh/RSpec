RSpec.describe "an example" do
  def help
    :available
  end

  it "has access to method defined in its method" do
    expect(help).to eq(:available)
  end
end
