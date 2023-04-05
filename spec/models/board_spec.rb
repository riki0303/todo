require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'タイトルと内容が入力されていれば、boardを保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password'
    })
    board = user.boards.build({
      name: 'aaaaaaaaaaaaaaaa',
      description: 'bbbbbbbbbbbbbbbbbbbbbb'
    })

    expect(board).to be_valid
  end
end
