class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

  def index
    page = (params[:page] || 1).to_i
    ids = ParsingDataService.parsing_hacker_news(page)

    @next, @prev = page + 1, page - 1
    @articles = Article.where(id: ids).where.not(content: nil)
  end

  def show
  end

  def sync_data
    ParsingDataService.parsing_hacker_news(1)

    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
