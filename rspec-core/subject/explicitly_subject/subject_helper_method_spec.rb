RSpec.describe Array, "with some elements" do
  def prepared_array
    [1, 2, 3]
  end

  subject { prepared_array }

  it "has the prescribed elements" do
    expect(subject).to eq([1, 2, 3])
  end
end
