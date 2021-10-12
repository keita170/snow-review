class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #イメージメソッドの追加
  has_one_attached :image

  has_many :student_posts, dependent: :destroy

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpeg image/png'))
      image.purge # Rails6では、この1行は必要ない
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end
end
