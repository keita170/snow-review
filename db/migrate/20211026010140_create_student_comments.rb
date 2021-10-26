class CreateStudentComments < ActiveRecord::Migration[5.2]
  def change
    create_table :student_comments do |t|
      
      t.integer :user_id
      t.integer :student_post_id
      
      t.text :comment
      
      t.timestamps
    end
  end
end
