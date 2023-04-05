require 'rails_helper'

RSpec.describe Board, type: :model do
  context 'タイトルと概要が入力されている場合' do
    let!(:user) do
      user = User.create!({
        email: 'test@example.com',
        password: 'password'
      })
    end

    let!(:board) do
      user.boards.build({
        name: 'aaaaaaaaaaaaaaaa',
        description: 'bbbbbbbbbbbbbbbbbbbbbb'
      })
    end

    it 'タイトルと内容が入力されていれば、boardを保存できる' do
      expect(board).to be_valid
    end
  end
end
