# -*- coding: utf-8 -*-
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @articles = Article.all.page params[:page]
  end

  def show
    @article = Article.friendly.find(params[:id])
    @comments = @article.comments.all
    @comment = @article.comments.build
    views = ViewCount.where(client_ip: request.remote_ip)
    ViewCount.create(article_id: @article.id, client_ip: request.remote_ip)
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Yazı silindi.' }
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Yazı kaydedildi.'
    else
      render :new
    end
  end

  def edit
    @comments = @article.comments.all
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Yazı kaydedildi.'
    else
      render :edit
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :tags, :body)
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
