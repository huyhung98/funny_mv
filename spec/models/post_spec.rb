require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    let!(:post) { create(:post) }

    it 'is not valid without a title' do
      post.title = nil
      expect(post).to_not be_valid
    end

    it 'is not valid without content' do
      post.content = nil
      expect(post).to_not be_valid
    end

    it 'is valid with a content regex' do
      post.content = 'www.youtube.com/abc'
      expect(post).to be_valid
    end

    it 'is not valid without a content regex' do
      post.content = 'tiktok.com/abv'
      expect(post).to_not be_valid
    end
  end
end
