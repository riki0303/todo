class CommentsController < ApplicationController
  def new
    @comment = current_user.comments.build
    @task = Task.find(params[:task_id])
    @comment.task_id = @task.id
    # boardは関連づけていないが、routeでネストしている為、form_withのmodelに指定する必要がある
    @board = Board.find(params[:board_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @task = Task.find(params[:task_id])
    @board = Board.find(params[:board_id])
    if @comment.save
      redirect_to board_task_path(id: @task.id), notice: '保存出来ました！'
    else
      flash.now[:error] = '保存に失敗しました！'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def comment_params
    params.require(:comment).permit(:description).merge(task_id: params[:task_id])
  end
end
