RSpec.describe WinCombinationsService do
  describe "#call" do
    subject(:combinations) { described_class.new.call }

    let(:expected_combinations) do
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ]
    end

    it { expect(combinations).to match_array(expected_combinations) }
  end
end
