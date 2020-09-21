class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, success: '投稿しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end


  def destroy
    # post = Post.find_by(user_id: current_user.admin)
    post = Post.find(params[:id])
    # favorite.user_id = current_user.id
    # favorite.topic_id = params[:topic_id]
    
    # if post.user_id == current_user.admin
    if current_user.admin
     　post.destroy #destroyメソッドを使用し対象のツイートを削除する。
    end
    # if post.delete
        # redirect_to posts_path, success: '削除しました'
    # end 
  end

  private
  def post_params
    params.require(:post).permit(:description)
  end
end
