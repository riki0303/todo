require 'rails_helper'

RSpec.describe Board, type: :model do
  let!(:user) { create(:user) }

  context '名前と概要が入力されている場合' do
    let!(:board) { build(:board, user:) }

    it '名前と内容が入力されていれば、boardを保存できる' do
      expect(board).to be_valid
    end
  end

  context '名前が入力されていない場合' do
    let!(:board) { build(:board, name: '', user:) }

    before do
      board.save
    end
    it '記事を保存できない' do
      expect(board.errors.messages[:name][0]).to eq('を入力してください')
    end
  end
end
