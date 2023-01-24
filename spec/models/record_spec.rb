require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:record) { create(:record) }

  it '事前に作成した通りのrecordを返す' do
    expect(record.record_animationname).to eq('test')
  end

  describe "各モデルとのアソシエーション" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Userモデルとのアソシエーション" do
      let(:target) { :user }

      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to  eq :belongs_to
      end
    end
  end

  describe 'scope' do
    describe 'nameorder' do
      subject { Record.nameorder }

      let!(:record) { create(:record) }

      it { is_expected.to include record }
    end

    describe 'lastorder' do
      subject { Record.lastorder }

      let!(:record) { create(:record) }

      it { is_expected.to include record }
    end
  end
end
