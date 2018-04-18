require "rails_helper"

describe InquiriesController do

  render_views

  describe "GET #new" do

    before do
      get :new
    end


    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    it "@inquiryに新しい問い合わせを割り当てる" do
      expect(assigns(:inquiry)).not_to eq nil
    end

    it "newテンプレートがrenderされる" do
      expect(response).to render_template :new
    end

  end

  describe "POST #create" do

    it "レスポンスが200であること" do
      expect(response.status).to eq 200
    end

    context "有効な属性の場合" do

      it "データベースに新しい問い合わせが登録されること" do
        expect{
          post :create, params: { inquiry: attributes_for(:inquiry, { name: "name", email: "sample@test.com", content: "content" })}
        }.to change(Inquiry, :count).by(1)
      end

      it "newテンプレートにリダイレクトされること" do
        post :create, params: { inquiry: attributes_for(:inquiry, { name: "name", email: "sample@test.com", content: "content" })}
        expect(response).to redirect_to new_inquiry_path
      end

    end

    context "無効な属性の場合" do

      it "データベースに新しい問い合わせを登録しないこと" do
        expect{
          post :create, params: { inquiry: attributes_for(:inquiry, { name: nil, email: nil, content: nil })}
        }.not_to change(Inquiry, :count)
      end

      it "newテンプレートを再表示すること" do
        post :create, params: { inquiry: attributes_for(:inquiry, { name: nil, email: nil, content: nil })}
        expect(response).to render_template :new
      end

    end

  end
end
