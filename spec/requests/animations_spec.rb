require 'rails_helper'

RSpec.describe 'Animations', type: :request do
  let(:animations) { create_list(:animation, 20) }

  describe '#index' do
    before do
      get animations_path(animations[0].id)
    end

    it '正常にレスポンスを返すこと' do
      expect(response).to have_http_status(:success)
    end

    it '作品の情報を取得すること' do
      expect(response.body).to include(
        animations[0].animation_name,
        animations[0].synopsis,
      )
    end

    it "作品を12件取得すること" do
      expect(Capybara.string(response.body)).to have_selector ".animation-title", count: 12
    end

    it "13件目の作品を取得しないこと" do
      expect(Capybara.string(response.body)).not_to have_selector ".animation-title", count: 13
    end
  end

  describe '#show' do
    before do
      get animation_path(animations[0].id)
    end

    it '正常にレスポンスを返すこと' do
      expect(response).to have_http_status(:success)
    end

    it '作品の情報を取得すること' do
      expect(response.body).to include(
        animations[0].animation_name,
        animations[0].synopsis,
      )
    end
  end

  describe '#search' do
    before do
      get search_animations_path
    end

    it '正常にレスポンスを返すこと' do
      expect(response).to have_http_status(:success)
    end
  end
end
