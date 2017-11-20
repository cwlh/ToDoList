class List < ApplicationRecord
  #驗證：欄位必須有值
  validates_presence_of :title, :date

  #allow_blank: :true 開啟允許空白
  validates :description, :presence => true, :allow_blank => true

  # 驗證：長度 20 個字符
  validates :title, length: {maximum: 20}
end
