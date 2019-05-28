RSpec.describe "a group with usser-defined metadata", foo: 'baz' do
  it "can be override by an example", foo: 'bazz' do |example|
    expect(example.metadata[:foo]).to eq('bazz')
  end

  describe "a sub-group with an override", foo: 'goo' do
    it "can be override by a sub-group" do |example|
      expect(example.metadata[:foo]).to eq('goo')
    end
  end
end
