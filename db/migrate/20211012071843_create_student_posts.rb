class CreateStudentPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :student_posts do |t|
      
      t.string :user_id
      
      t.string :title
      t.text :body
      t.integer :field
      t.integer :status

      t.timestamps
    end
  end
end
