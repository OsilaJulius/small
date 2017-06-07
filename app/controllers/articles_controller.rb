class ArticlesController < ApplicationController
  def show
    
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      flash[:success] = "Posting success."
      redirect_to root_path
    else
      flash.now[:danger] = "Your article should not be blank "
      flash.now[:danger] += "and must be less than 144 characters."
      render 'static_pages/home'
    end
  end

  private
    def article_params
      params.require(:article).permit(:content)
    end
end
