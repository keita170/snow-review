class StudentPostsController < ApplicationController
  def index
    @student_posts = StudentPost.all
    
    if params[:sort] == 'status'
      @student_posts = StudentPost.all
    elsif params[:sort] == 'status-reverse'
      @student_posts = StudentPost.all.order('status DESC')
    end
  end

  def show
    @student_post = StudentPost.find(params[:id])
    @student_comment = StudentComment.new
  end

  def new
    @student_post = StudentPost.new
  end

  def create
    @student_post = StudentPost.new(student_post_params)
    @student_post.user_id = current_user.id
    @student_post.save
    redirect_to student_posts_path
  end

  private

  def student_post_params
    params.require(:student_post).permit(:title, :body, :field, :status)
  end

end