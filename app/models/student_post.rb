class StudentPost < ApplicationRecord
  belongs_to :user

  enum field: { 選択肢１: 0, 選択肢２: 1 }
  enum status: { 受付中: 0, 締め切り: 1}
end
