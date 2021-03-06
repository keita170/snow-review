class StudentPost < ApplicationRecord
  belongs_to :user
  has_many :student_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  #enumを用いて数字で扱えるようにする
  enum field: { 選択肢１: 0, 選択肢２: 1 }
  enum status: { 受付中: 0, 締め切り: 1}
end
