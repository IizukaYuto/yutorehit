class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメント投稿しました'
    else
      redirect_to comments_new_path, danger: 'コメント投稿失敗'
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body,:user_id,:topic_id)
  end
end