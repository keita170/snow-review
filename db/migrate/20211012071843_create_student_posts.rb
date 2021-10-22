class CreateStudentPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :student_posts do |t|

      t.string :user_id#投稿にユーザーIDを結びつけたい為
      t.string :title#投稿のタイトル
      t.text :body#投稿の本文
      t.integer :field#投稿の分野
      t.integer :status#投稿のステータス(状況)

      t.timestamps
    end
  end
end
