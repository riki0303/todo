class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    # formで使う為のインスタンス指定
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

  def edit
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:name, :description)
  end
end
