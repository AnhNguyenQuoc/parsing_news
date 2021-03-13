class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :content_exist?, only: [:show]

  def index
    @articles = Article.where.not(content: nil).order(created_at: :asc)
  end

  def show
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def content_exist?
    if @article.content.nil?
      content = ParsingDataService.parsing_hacker_news_article(@article.url)
      @article.update(content: content)
      @article.reload!
    end
  end
end
