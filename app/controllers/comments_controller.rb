class CommentsController < ApplicationController
  def edit
    @article = Article.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.where("article_ref = :art_id",
                art_id: params[:id]).paginate(page: params[:page])
  end

  def create
    @article = Article.find_by(id: params[:article_ref])
    @comment = Comment.new(comment_params)
    @comments = Comment.where("article_ref = :art_id",
                art_id: params[:id]).paginate(page: params[:page])

    if @comment.save
      flash[:success] = "Comment posted"
      redirect_to comment_create(@article)
    else
      flash.now[:danger] = "Comments must not be blank"
      render 'edit'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :contents, :article_ref)
    end
end
