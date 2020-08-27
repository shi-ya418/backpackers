class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      tag_list = tag_params[:name].split(/[[:blank:]]+/).select(&:present?)
      @post.save_tags(tag_list)
      redirect_to root_path, notice: '投稿されました'
    else
      flash.now[:alert] = 'textを入力してください。'
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: '投稿が削除されました'
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to root_path, notice: '更新が完了しました'
    else
      flash.now[:alert] = 'エラーがあります'
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    @like = Like.new
  end
  

  def search
    @posts = Post.search(params[:keyword])
  end 
 
  private
  def post_params
    params.require(:post).permit(:image, :text, :video, :good_ids).merge(user_id: current_user.id)
  end

  def tag_params
    params.require(:post).permit(:name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end


