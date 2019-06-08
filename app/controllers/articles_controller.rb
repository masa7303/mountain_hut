class ArticlesController < ApplicationController
  def index
    @articles = Article.order(released_at: :desc)  # 降順
  end

  def show
    @ariticle = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "ニュースを登録しました。"
    else
      render "new"
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :released_at, :expired_at, :member_only)
    end
end
