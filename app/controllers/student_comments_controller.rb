class StudentCommentsController < ApplicationController

  def create
    student_post = StudentPost.find(params[:student_post_id])
    comment = current_user.student_comments.new(student_comment_params)
    comment.student_post_id = student_post.id
    comment.save
    redirect_to student_post_path(student_post)
  end

  def destroy
    StudentComment.find_by(id: params[:id]).destroy
    redirect_to student_post_path(params[:student_post_id])
  end

  private

  def student_comment_params
    params.require(:student_comment).permit(:comment)
  end
end