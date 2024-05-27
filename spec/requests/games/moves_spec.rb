RSpec.describe "Moves" do
  describe "POST /games/:game_id/moves" do
    let(:game) { create(:game) }

    it "returns http success" do
      post "/games/#{game.id}/moves", params: { row: 1, column: 1, symbol: Move::O_SYMBOL }
      expect(response).to redirect_to(game_path(game))
    end

    shared_examples "bad_request" do
      it "returns http bad request" do
        post("/games/#{game.id}/moves", params:)
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "without row" do
      let(:params) { { olumn: 1, symbol: Move::O_SYMBOL } }

      it_behaves_like "bad_request"
    end

    context "without column" do
      let(:params) { { row: 1, symbol: Move::O_SYMBOL } }

      it_behaves_like "bad_request"
    end

    context "without symbol" do
      let(:params) { { row: 1, column: 1 } }

      it_behaves_like "bad_request"
    end
  end
end
