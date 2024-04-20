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

    context "when args provided" do
      subject(:combinations) { described_class.new(max_rows: 4, max_columns: 4).call }

      let(:expected_combinations) do
        [
          [1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16],
          [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15], [4, 8, 12, 16],
          [1, 6, 11, 16], [4, 7, 10, 13]
        ]
      end

      it { expect(combinations).to match_array(expected_combinations) }
    end
  end
end
