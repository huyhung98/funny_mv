require 'rails_helper'

RSpec.describe HomeController do
  render_views

  it 'should get index' do
    get :index
    expect(response.code).to eq '200'
  end

  it "should display posts" do
    (1..10).each do |n|
      create(:post, user: create(:user, email: "email#{n}@mail.com"))
    end

    get :index
    expect(response.body).to have_selector('div.row')
    expect(response.body).to have_selector('div.card')
    expect(response.body).to have_selector('div.card', count: 10)
  end
end