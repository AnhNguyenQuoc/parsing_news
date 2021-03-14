class ArticlesController < ApplicationController
  include Pagy::Backend
  before_action :set_article, only: [:show]
  before_action :content_exist?, only: [:show]

  def index
    @pagy, @articles = pagy_countless(Article.all.order(created_at: :desc), items: 30, link_extra: 'data-remote="true"')
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

  def content_exist?
    if @article.content.nil?
      content = ParsingDataService.parsing_hacker_news_article(@article.url)
      @article.update(content: content)
      @article.reload!
    end
  end
end
