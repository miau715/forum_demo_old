class BoardsController < ApplicationController
  def index
    @boards = Board.all
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @boards }
    end
  end
  
  def show
    @board = Board.find(params[:id])
    
    @posts = @board.posts
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @board }
    end
  end  
end
