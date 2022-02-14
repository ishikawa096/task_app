class PostsController < ApplicationController
  def index
    @posts = Post.order(:start_date)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :allday, :memo))
    if @post.save
      flash[:notice_green] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash.now[:notice] = "スケジュールを登録できませんでした"
      render "new"
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
    if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :allday, :memo))
      flash[:notice_green] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash.now[:notice] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
end