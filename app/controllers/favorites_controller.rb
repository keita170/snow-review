class FavoritesController < ApplicationController
  
  def create
    student_post = StudentPost.find(params[:student_post_id])
    favorite = current_user.favorites.new(student_post_id: student_post.id)
    favorite.save
    redirect_to student_post_path(student_post)
  end
    
  def destroy
    student_post = StudentPost.find(params[:student_post_id])
    favorite = current_user.favorites.find_by(student_post_id: student_post.id)
    favorite.destroy
    redirect_to student_post_path(student_post)
  end

end
