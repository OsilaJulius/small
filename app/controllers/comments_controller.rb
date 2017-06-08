class CommentsController < ApplicationController
  def edit
    get_article(params[:id])
    @article = current_article
    @user = User.find_by(id: @article.user_id)
    @comment = Comment.new
    @comments = Comment.where("article_id = :art_id",
                art_id: @article.user_id).paginate(page: params[:page])
  end

  def create
    content = params[:comment][:content]
    article = current_article

    @comment = Comment.new(commenter: current_user.id, content: content,
               article_id: article.id)

    if @comment.save
      flash[:success] = "Successful commenting!"
    else
      flash[:danger] = "Invalid comment!"
    end

    redirect_to comment_new_url(current_article)
  end
end
