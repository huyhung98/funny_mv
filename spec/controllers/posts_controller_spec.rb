require 'rails_helper'

RSpec.describe PostsController do
  describe '#create' do
    let!(:user) { create(:user) }

    context 'user is not loged in' do
      it "redirect to homepage" do
        get :new
        expect(response).to redirect_to root_url
      end
    end

    context 'user is logged in' do
      it 'render new page' do
        session[:user_id] = user.id
        get :new
        expect(response).to have_http_status(:ok)
      end

      it 'can create a new post with valid params' do
        session[:user_id] = user.id
        post_params = { post: { content: "https://www.youtube.com/watch?v=Fpn1imb9qZg" } }
        expect {
          post :create, params: post_params 
        }.to change(Post, :count).by(1)
      end
    end
  end
end