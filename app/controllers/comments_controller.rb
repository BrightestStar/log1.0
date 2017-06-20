class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def create
    @log = Log.find(params[:log_id])
    @comment = @log.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to logs_path(@logs), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    redirect_to request.referer, notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :log_id, :user_id)
  end

end
