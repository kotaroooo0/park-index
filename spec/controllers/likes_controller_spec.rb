require 'rails_helper'

describe LikesController do

  render_views

  describe "ログインしたユーザーのとき" do

    before do
      @user = create(:user, id: 1)
      @comment = create(:comment, id: 1)
      set_user_session @user
    end

    describe "POST #create" do

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
        @like = create(:like, user_id: 1, comment_id: 1)
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

  describe "ゲストユーザーのとき" do

    before do
      @user = create(:user, id: 1)
      @comment = create(:comment, id: 1)
    end

    describe "POST #create" do

      it "ログインを要求すること" do
        post :create, params: attributes_for(:like, user_id: 1, comment_id: 1), xhr: true
        expect(response).to require_login
      end

    end

    describe "DELETE #destroy" do

      before  do
        skip
        @like = create(:like, user_id: 1, comment_id: 1)
      end

      it "ログインを要求すること" do
        delete :destroy, params: attributes_for(:like, comment_id: 1), xhr: true
        expect(response).to require_login
      end
    end
  end
end
