class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  
  def show
    @board = Board.find(params[:id])
  end
  
  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(params[:board])
    @board.save
  end

  def edit
    @board = Board.find(params[:id])
  end
  
  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
  end
  
end
