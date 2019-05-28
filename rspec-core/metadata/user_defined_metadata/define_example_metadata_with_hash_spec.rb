RSpec.describe "a group with no user_defined metadata" do
  it "has an example with metadata", foo: 17 do |example|
    expect(example.metadata[:foo]).to eq(17)
    expect(example.metadata).not_to include(:bar)
  end

  it "has another example with metadata", bar: 12, bazz: 33 do |example|
    expect(example.metadata[:bar]).to eq(12)
    expect(example.metadata[:bazz]).to eq(33)
    expect(example.metadata).not_to include(:foo)
  end
end
