class TodosController < ApplicationController
  def index
    todo = Todo.all
    render json: todo, status: :ok
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    todo = Todo.create!(todo_params)
    render json: todo, status: :created
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.delete
    head :no_content
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  private

  def todo_params
    params.permit(:name)
  end  
end