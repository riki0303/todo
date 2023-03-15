class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  def index
    @boards = Board.all
  end

  def show; end

  def new
    # formで使う為のインスタンス指定
    # newアクションではnewの代わりにbuildを指定する場合が多い（可読性向上のため）
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to board_path(@board), notice: '保存出来ました！'
    else
      flash.now[:error] = '保存に失敗しました！'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to board_path(@board), notice: '更新出来ました！'
    else
      flash.now[:error] = '更新に失敗しました！'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除出来ました！'
  end

  # create,editでの変更内容を制御
  private

  def board_params
    params.require(:board).permit(:name, :description)
  end

  # before_actionに設定
  def set_board
    @board = Board.find(params[:id])
  end
end
