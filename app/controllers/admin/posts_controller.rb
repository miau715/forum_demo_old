class Admin::PostsController < ApplicationController
  layout 'admin'
  before_filter :require_is_admin
  before_filter :find_board
  before_filter :authenticate_user!, :except => [ :index ]

  def edit
    @post =  Post.find(params[:id])    
  end

  def update
    @post = Post.find(params[:id])
    
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
    @post = Post.find(params[:id])
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
