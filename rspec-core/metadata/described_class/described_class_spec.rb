RSpec.describe Fixnum do
  it "is available as described_class" do
    expect(described_class).to eq(Fixnum)
  end
end
