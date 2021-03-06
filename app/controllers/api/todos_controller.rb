class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: 200
    else
      render json: "fail to create.\n", status: 500
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: "destroy a todo.\n"
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: @todo, status: 200
    else
      render json: "fail to update.\n", status: 500
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end
