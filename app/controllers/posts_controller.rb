class PostsController < ApplicationController
  before_filter  :find_board
    
  def index
    redirect_to board_path(@board)
  end
  
  def show
    @post = @board.posts.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post }
    end
  end
    
  def new
    @post = @board.posts.build
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def edit
    @post = @board.posts.find(params[:id])    
  end
    
  def create
    @post = @board.posts.build(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(board_post_path(@board, @post), :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = @board.posts.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(board_post_path(@board, @post), :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @post = @board.posts.find(params[:id])
    @post.destroy
    
    respond_to do |format|
      format.html { redirect_to(board_posts_path(@board, @post)) }
      format.xml  { head :ok }
    end
  end
  
  protected
  def find_board
    @board = Board.find(params[:board_id])
  end
end
