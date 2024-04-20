RSpec.describe WinCombinationsService do
  describe "#call" do
    subject(:combinations) { described_class.new.call }

    let(:expected_combinations) do
      [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
        [1, 5, 9],
        [3, 5, 7]
      ]
    end

    it { expect(combinations).to match_array(expected_combinations) }
  end
end
