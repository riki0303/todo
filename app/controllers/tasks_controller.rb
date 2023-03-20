class TasksController < ApplicationController
  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # user_idをログインユーザーのidとしたtaskインスタンスを生成
    @task = current_user.tasks.build
    # taskの不足しているboard_idを下記で指定
    @board = Board.find(params[:board_id])
    @task.board_id = @board.id
  end

  def create
    # user_idをログインユーザーのidとしたtaskインスタンスを生成
    @task = current_user.tasks.build(task_params)
    # taskのboard_idを下記で指定
    @board = current_user.boards.find(params[:board_id])
    @task.board_id = @board.id
    if @task.save
      redirect_to board_tasks_path, notice: '保存出来ました！'
    else
      flash.now[:error] = '保存に失敗しました！'
      render :new, status: :unprocessable_entity
    end
  end

  def edit;
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @board = current_user.boards.find(params[:board_id])
    @task.board_id = @board.id
    if @task.update(task_params)
      redirect_to board_tasks_path, notice: '更新出来ました！'
    else
      flash.now[:error] = '更新に失敗しました！'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    board = current_user.boards.find(params[:board_id])
    task.board_id = board.id
    task.destroy!
    redirect_to board_tasks_path, notice: '削除出来ました！'
  end

  # create,editでの変更内容を制御
  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
