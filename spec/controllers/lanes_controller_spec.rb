require 'rails_helper'

describe LanesController do

  render_views

  describe "ログインしたユーザーのとき" do

    before do
      @user = create(:user, id: 1)
      @park = create(:park, id: 1)
      set_user_session @user
    end

    describe "POST #create" do

      it "レスポンスが302であること" do
        post :create, params: { park_id: 1, lane: attributes_for(:lane, name: "name", items: "items", user_id: 1) }
        expect(response.status).to eq 302
      end

      context "有効な属性の場合"  do

        it "データベースにレーンが登録されること" do
          expect{
            post :create, params: { park_id: 1, lane: attributes_for(:lane, name: "name", items: "items", user_id: 1) }
          }.to change(Lane, :count).by(1)
        end

        it "パーク詳細にリダイレクトされること" do
          post :create, params: { park_id: 1, lane: attributes_for(:lane, name: "name", items: "items", user_id: 1) }
          expect(response).to redirect_to(park_path(id: 1))
        end

      end

      context "無効な属性の場合" do

        it "データベースにレーンが登録されないこと" do
          expect{
            post :create, params: { park_id: 1, lane: attributes_for(:lane, name: nil, items: "items", user_id: 1) }
          }.not_to change(Comment, :count)
        end

        it "パーク詳細にリダイレクトされること" do
          post :create, params: { park_id: 1, lane: attributes_for(:lane, name: nil, items: "items", user_id: 1) }
          expect(response).to redirect_to(park_path(id: 1))
        end
      end
    end

    describe "PATCH #update" do

      before do
        skip
        @lane = create(:lane, id: 1)
      end

      it "レスポンスが302であること" do
        patch :update, params: { lane_id: 1, lane: attributes_for(:lane) }
        expect(response.status).to eq 302
      end

      context "有効な属性の場合"  do

        it "@laneに適切なレーンを割り当てる" do
          patch :update, params: { lane_id: @lane.id, user: attributes_for(:lane, name: "new_name", items: "new_items") }
          expect(assigns(:lane)).to eq @lane
        end

        it "@laneの属性を変更すること" do
          patch :update, params: { lane_id: @lane.id, user: attributes_for(:lane, name: "new_name", items: "new_items") }
          @lane.reload
          expect(@lane.name).to eq('new_name')
          expect(@lane.items).to eq('new_items')
        end

        it "パーク詳細にリダイレクトされること" do
          patch :update, params: { lane_id: @lane.id, user: attributes_for(:lane, name: "new_name", items: "new_items") }
          expect(response).to redirect_to(park_path(id: 1))
        end

      end

      context "無効な属性の場合" do

        it "@laneの属性が変更されないこと" do
          patch :update, params: { lane_id: @lane.id, user: attributes_for(:lane, name: "new_name", items: "new_items") }
          @lane.reload
          expect(@lane.name).not_to eq('new_name')
          expect(@lane.items).to eq('items')
        end

        it "パーク詳細にリダイレクトされること" do
          patch :update, params: { lane_id: @lane.id, user: attributes_for(:lane, name: "new_name", items: "new_items") }
          expect(response).to redirect_to(park_path(id: 1))
        end
      end
    end

    describe "DELETE #destroy" do

      before  do
        @lane = create(:lane, id: 1)
      end

      it "レスポンスが302であること" do
        delete :destroy, params: { id: 1 }
        expect(response.status).to eq 302
      end

      it "データベースからレーンが削除されること" do
        expect{
          delete :destroy, params: { id: 1 }
        }.to change(Lane, :count).by(-1)
      end

      it "元のページにリダイレクトされること" do
        skip
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
