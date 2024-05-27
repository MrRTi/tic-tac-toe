RSpec.describe BoardService do
  describe "#call" do
    subject(:board) { described_class.new(moves) }

    let(:game) { create(:game) }
    let(:moves) do
      [
        build(:move, game:, row: 0, column: 0, symbol: Move::O_SYMBOL),
        build(:move, game:, row: 1, column: 2, symbol: Move::X_SYMBOL),
        build(:move, game:, row: 2, column: 1, symbol: Move::O_SYMBOL)
      ]
    end

    let(:expected_board) { ["o", nil, nil, nil, nil, "x", nil, "o", nil] }

    it { expect(board.call).to eq(expected_board) }
  end
end
