class StaticPagesController < ApplicationController
  def home
    if is_signed_in?
      @article = current_user.articles.build
      @articles = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
