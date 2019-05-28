RSpec.describe "a group with user-defined metadata", foo: 17 do
  it "has access to the metadata in the example" do |example|
    expect(example.metadata[:foo]).to eq(17);
  end

  it "does not have access to metadata defined on sub-groups" do |example|
    expect(example.metadata).not_to include(:bar)
  end

  describe "a sub-group with user-defined metadata", bar: 12 do
    it "has access to the sub-group metadata" do |example|
      expect(example.metadata[:bar]).to eq(12)
    end

    it "also hash access to metadata defined on parent groups" do |example|
      expect(example.metadata[:foo]).to eq(17)
    end
  end
end
