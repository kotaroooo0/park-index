require 'rails_helper'

describe CommentsController do

  render_views

  describe "ログインしたユーザーのとき" do

    before do
      @user = create(:user, id: 1)
      @park = create(:park, id: 1)
      set_user_session @user
    end

    describe "POST #create" do

      context "有効な属性の場合" do

        it "レスポンスが302であること" do
          post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
          expect(response.status).to eq 302
        end

        it "データベースにコメントが登録されること" do
          expect{
            post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
          }.to change(Comment, :count).by(1)
        end

        it "@commentに適当なコメントが割り当てられる" do
          post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
          expect(assigns(:comment)).to eq Comment.find_by(user_id: 1, park_id: 1)
        end

        it "パーク詳細にリダイレクトされること" do
          post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
          expect(response).to redirect_to(park_path(id: 1))
        end

      end

      context "無効な属性の場合" do

        it "レスポンスが302であること" do
          post :create, params: { comment: attributes_for(:comment, body: nil, park_id: 1) }
          expect(response.status).to eq 302
        end

        it "データベースにコメントが登録されないこと" do
          expect{
            post :create, params: { comment: attributes_for(:comment, body: nil, park_id: 1) }
          }.not_to change(Comment, :count)
        end

        it "パーク詳細にリダイレクトされること" do
          post :create, params: { comment: attributes_for(:comment, body: nil, park_id: 1) }
          expect(response).to redirect_to(park_path(id: 1))
        end
      end

    end

    describe "DELETE #destroy" do

      before  do
        @comment = create(:comment, id: 1, user_id: 1, park_id: 1, body: "body")
      end

      it "レスポンスが302であること" do
        delete :destroy, params: { id: 1 }
        expect(response.status).to eq 302
      end

      it "データベースからコメントが削除されること" do
        expect{
          delete :destroy, params: { id: 1 }
        }.to change(Comment, :count).by(-1)
      end

      it "元のページににリダイレクトされること" do
        skip
        post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
        expect(response).to redirect_to('/')
      end
    end
  end

  describe "ゲストユーザーのとき" do

    before do
      @user = create(:user, id: 1)
    end

    describe "POST #create" do

      it "ログインを要求すること" do
        post :create, params: { comment: attributes_for(:comment, body: "body", park_id: 1) }
        expect(response).to require_login
      end

    end

    describe "DELETE #destroy" do

      before  do
        @comment = create(:comment, id: 1)
      end

      it "ログインを要求すること" do
        delete :destroy, params: { id: 1 }
        expect(response).to require_login
      end
    end
  end
end
