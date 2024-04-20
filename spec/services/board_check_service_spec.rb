RSpec.describe BoardCheckService do
  describe "#win?" do
    subject(:check) { described_class.new(board, max_rows:, max_columns:).win?(Move::O_SYMBOL) }

    let(:max_rows) { Game::MAX_ROWS }
    let(:max_columns) { Game::MAX_COLUMNS }

    row_boards = [
      [Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL,
       Move::X_SYMBOL, Move::X_SYMBOL, nil,
       nil, nil, nil],
      [Move::X_SYMBOL, Move::X_SYMBOL, nil,
       Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL,
       nil, nil, nil],
      [Move::X_SYMBOL, Move::X_SYMBOL, nil,
       nil, nil, nil,
       Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL]
    ]

    row_boards.each_with_index do |board_case, idx|
      context "with row case #{idx}" do
        let(:board) { board_case }

        it { expect(check).to be_truthy }
      end
    end

    column_boards = [
      [Move::O_SYMBOL, Move::X_SYMBOL, nil,
       Move::O_SYMBOL, nil, nil,
       Move::O_SYMBOL, Move::X_SYMBOL, nil],
      [Move::X_SYMBOL, Move::O_SYMBOL, nil,
       nil, Move::O_SYMBOL, nil,
       Move::X_SYMBOL, Move::O_SYMBOL, nil],
      [nil, Move::X_SYMBOL, Move::O_SYMBOL,
       nil, nil, Move::O_SYMBOL,
       nil, Move::X_SYMBOL, Move::O_SYMBOL]
    ]

    column_boards.each_with_index do |board_case, idx|
      context "with column case #{idx}" do
        let(:board) { board_case }

        it { expect(check).to be_truthy }
      end
    end

    diagonal_boards = [
      [Move::O_SYMBOL, Move::X_SYMBOL, nil,
       nil, Move::O_SYMBOL, nil,
       nil, Move::X_SYMBOL, Move::O_SYMBOL],
      [Move::X_SYMBOL, nil, Move::O_SYMBOL,
       nil, Move::O_SYMBOL, nil,
       Move::O_SYMBOL, Move::X_SYMBOL, nil]
    ]

    diagonal_boards.each_with_index do |board_case, idx|
      context "with diagonal case #{idx}" do
        let(:board) { board_case }

        it { expect(check).to be_truthy }
      end
    end

    context "when board is full and should not win" do
      let(:board) do
        [
          [Move::O_SYMBOL, Move::X_SYMBOL, Move::X_SYMBOL,
           Move::X_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL,
           Move::O_SYMBOL, Move::O_SYMBOL, Move::X_SYMBOL]
        ]
      end

      it { expect(check).to be_falsey }
    end

    context "when board should not win" do
      let(:board) do
        [
          [Move::O_SYMBOL, Move::X_SYMBOL, nil,
           Move::X_SYMBOL, Move::O_SYMBOL, nil,
           Move::O_SYMBOL, Move::X_SYMBOL, nil]
        ]
      end

      it { expect(check).to be_falsey }
    end

    context "when board is empty" do
      let(:board) { [] }

      it { expect(check).to be_falsey }
    end
  end
end
