RSpec.describe BoardCheckService do
  describe "#win_combination" do
    subject(:check) { described_class.new(board).win_combination(Move::O_SYMBOL) }

    row_boards = [
      [[Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL,
        Move::X_SYMBOL, Move::X_SYMBOL, nil,
        nil, nil, nil], [0, 1, 2]],
      [[Move::X_SYMBOL, Move::X_SYMBOL, nil,
        Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL,
        nil, nil, nil], [3, 4, 5]],
      [[Move::X_SYMBOL, Move::X_SYMBOL, nil,
        nil, nil, nil,
        Move::O_SYMBOL, Move::O_SYMBOL, Move::O_SYMBOL], [6, 7, 8]]
    ]

    row_boards.each_with_index do |(board_case, comb), idx|
      context "with row case #{idx}" do
        let(:board) { board_case }
        let(:combination) { comb }

        it { expect(check).to eq(combination) }
      end
    end

    column_boards = [
      [[Move::O_SYMBOL, Move::X_SYMBOL, nil,
        Move::O_SYMBOL, nil, nil,
        Move::O_SYMBOL, Move::X_SYMBOL, nil], [0, 3, 6]],
      [[Move::X_SYMBOL, Move::O_SYMBOL, nil,
        nil, Move::O_SYMBOL, nil,
        Move::X_SYMBOL, Move::O_SYMBOL, nil], [1, 4, 7]],
      [[nil, Move::X_SYMBOL, Move::O_SYMBOL,
        nil, nil, Move::O_SYMBOL,
        nil, Move::X_SYMBOL, Move::O_SYMBOL], [2, 5, 8]]
    ]

    column_boards.each_with_index do |(board_case, comb), idx|
      context "with column case #{idx}" do
        let(:board) { board_case }
        let(:combination) { comb }

        it { expect(check).to eq(combination) }
      end
    end

    diagonal_boards = [
      [[Move::O_SYMBOL, Move::X_SYMBOL, nil,
        nil, Move::O_SYMBOL, nil,
        nil, Move::X_SYMBOL, Move::O_SYMBOL], [0, 4, 8]],
      [[Move::X_SYMBOL, nil, Move::O_SYMBOL,
        nil, Move::O_SYMBOL, nil,
        Move::O_SYMBOL, Move::X_SYMBOL, nil], [2, 4, 6]]
    ]

    diagonal_boards.each_with_index do |(board_case, comb), idx|
      context "with diagonal case #{idx}" do
        let(:board) { board_case }
        let(:combination) { comb }

        it { expect(check).to eq(combination) }
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

      it { expect(check).to be_nil }
    end

    context "when board should not win" do
      let(:board) do
        [
          [Move::O_SYMBOL, Move::X_SYMBOL, nil,
           Move::X_SYMBOL, Move::O_SYMBOL, nil,
           Move::O_SYMBOL, Move::X_SYMBOL, nil]
        ]
      end

      it { expect(check).to be_nil }
    end

    context "when board is empty" do
      let(:board) { [] }

      it { expect(check).to be_nil }
    end
  end

  describe "#win?" do
    subject(:check) { described_class.new(board).win?(Move::O_SYMBOL) }

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
