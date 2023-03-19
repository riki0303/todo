class TasksController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # user_idをログインユーザーのidとしたインスタンスを生成
    @task = current_user.tasks.build
    # taskの不足しているboard_idを下記で指定
    @board = Board.find(params[:board_id])
    @task.board_id = @board.id
  end

  def create
    @task = current_user.tasks.build(task_params)
    # taskのboard_idを下記で指定
    @board = Board.find(params[:board_id])
    @task.board_id = @board.id
    if @task.save
      redirect_to board_tasks_path, notice: '保存出来ました！'
    else
      flash.now[:error] = '保存に失敗しました！'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end


  def destroy; end

  # create,editでの変更内容を制御
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
