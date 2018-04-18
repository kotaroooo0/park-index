require "rails_helper"

describe LikesController do

  render_views

  describe "POST #create" do

    before do
      @user = create(:user, id: 1)
      @comment = create(:comment, id: 1)
      session[:user_id] = 1
    end

    it "レスポンスが200であること" do
      post :create, params: attributes_for(:like, user_id: 1, comment_id: 1), xhr: true
      expect(response.status).to eq 200
    end

    it "データベースにいいねが登録されること" do
      expect{
        post :create, params: attributes_for(:like, user_id: 1, comment_id: 1), xhr: true
      }.to change(Like, :count).by(1)
    end

    it "@likesに適当ないいねが割り当てられる" do
      post :create, params: attributes_for(:like, user_id: 1, comment_id: 1), xhr: true
      expect(assigns(:likes)).to eq Like.where(comment_id: 1)
    end

    it "@commentに適当なコメントが割り当てられる" do
      post :create, params: attributes_for(:like, user_id: 1, comment_id: 1), xhr: true
      expect(assigns(:comment)).to eq Comment.find(1)
    end


  end

  describe "DELETE #destroy" do

    before  do
      skip
      @user = create(:user, id: 1)
      @comment = create(:comment, id: 1)
      @like = create(:like, user_id: 1, comment_id: 1)
      session[:user_id] = 1
    end

    it "レスポンスが200であること" do
      delete :destroy, params: attributes_for(:like, comment_id: 1), xhr: true
      expect(response.status).to eq 200
    end

    it "データベースからいいねが削除されること" do
      expect{
        delete :destroy, params: attributes_for(:like, comment_id: 1), xhr: true
      }.to change(Like, :count).by(-1)
    end

    it "@likesに適当ないいねが割り当てられる" do
      delete :destroy, params: attributes_for(:like, comment_id: 1), xhr: true
      expect(assigns(:likes)).to eq Like.where(comment_id: 1)
    end

    it "@commentに適当なコメントが割り当てられる" do
      delete :destroy, params: attributes_for(:like, comment_id: 1), xhr: true
      expect(assigns(:comment)).to eq Comment.find(1)
    end
  end

end
