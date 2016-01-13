class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  def swap_visibility
    if current_user && current_user.admin
      @comment = Comment.find(params[:comment_id])

      if @comment.visible
        @comment.visible = false
        @comment.save
      else
        @comment.visible = true
        @comment.save
      end

      redirect_to @comment.article
    else
      render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end
  end

  def create
    @article = Article.friendly.find(comment_params[:article_id])
    @comment = Comment.new(comment_params)
    @comment.client_ip = request.remote_ip
    if @comment.save
      redirect_to @article, notice: 'Yorum gönderildi.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.article, notice: 'Yorum silindi.' }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:email, :name, :body, :article_id)
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
