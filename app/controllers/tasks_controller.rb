class TasksController < ApplicationController

  def index
    @board = Board.find(params[:board_id])
    @tasks = @board.tasks
  end

  def show
    @task = Task.find(params[:id])
  end

end