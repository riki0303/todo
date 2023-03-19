class TasksController < ActionController::Base

  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks
  end

end