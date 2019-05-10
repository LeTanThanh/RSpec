RSpec.describe Array do
  describe "with 3 items" do
    subject { [1, 2, 3] }

    it { should_not be_empty }
    it { is_expected.not_to be_empty }
  end
end
