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
    
    @posts = @board.posts.recent.paginate(:page => params[:page], :per_page => 5 )
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @board }
    end
  end  
end
