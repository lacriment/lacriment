class CommentsController < ApplicationController

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

  private
  def comment_params
    params.require(:comment).permit(:email, :name, :body, :article_id)
  end
end
