RSpec.describe "Games" do
  describe "GET /index" do
    it "returns http success" do
      get "/games"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    context "when game is in database" do
      let!(:game) { create(:game) }

      it "returns http success" do
        get "/games", params: { game_id: game.id }
        expect(response).to have_http_status(:success)
      end
    end

    it "returns http not found" do
      get "/game/"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      post "/games"
      expect(response).to redirect_to(game_path(Game.last))
    end
  end
end
