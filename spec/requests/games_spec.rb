RSpec.describe "Games" do
  describe "GET /games" do
    it "returns http success" do
      get "/games"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /games/:game_id" do
    context "when game is in database" do
      let!(:game) { create(:game) }

      it "returns http success" do
        get "/games/#{game.id}"
        expect(response).to have_http_status(:success)
      end
    end

    it "returns http not found" do
      get "/games/0"

      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /games" do
    it "returns http success" do
      post "/games"
      expect(response).to redirect_to(game_path(Game.last))
    end
  end
end
