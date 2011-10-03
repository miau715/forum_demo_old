class BoardsController < ApplicationController
  def index
    @boards = Board.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boards }
    end
  end
  
  def show
    @board = Board.find(params[:id])
    
    @posts = Post.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @board }
    end
  end
  
  def new
    @board = Board.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @board }
    end
  end
  
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])
    @board.save
    
    respond_to do |format|
      if @board.save
        format.html { redirect_to(@board, :notice => 'Board was successfully created.') }
        format.xml  { render :xml => @board, :status => :created, :location => @board }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params[:board])
    
    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to(@board, :notice => 'Board was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @board.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    
    respond_to do |format|
      format.html { redirect_to(boards_url) }
      format.xml  { head :ok }
    end
  end
  
end
