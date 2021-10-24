class StudentPostsController < ApplicationController
  def index
    @student_posts = StudentPost.all
  end

  def show
    @student_post = StudentPost.find(params[:id])
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