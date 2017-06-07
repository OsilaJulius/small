class StaticPagesController < ApplicationController
  def home
    if is_signed_in?
      @article = current_user.articles.build
      @articles = Article.where("user_id = ?", current_user.id).paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
