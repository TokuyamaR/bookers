class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :asc)
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @posts = Post.all.order(created_at: :asc)
  	if @post.save
      flash[:notice] = "Post was successfully created."
	    redirect_to post_path(@post.id)
    else
      flash[:notice] = "Title and body can't be blanked."
      render "posts/index"
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
    	flash[:notice] = "Post was successfully updated."
    	redirect_to post_path(@post.id)
    else
      flash[:notice] = "Title and body can't be blanked."
      render "posts/edit"
    end


  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	flash[:notice] = "Post was successfully destroyed."
  	redirect_to index_path
  end


  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
