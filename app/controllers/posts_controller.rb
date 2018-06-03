class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :asc)

  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
  	post.save
    flash[:notice] = "投稿が完了しました"

	  redirect_to post_path(post.id)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	flash[:notice] = "更新が完了しました。"
  	redirect_to post_path(post.id)

  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	flash[:notice] = "投稿を削除しました"
  	redirect_to index_path
  end


  private

  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
