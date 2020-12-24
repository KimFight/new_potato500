class Order < ApplicationRecord

  belongs_to :purchase

  
# 都道府県の情報を「JpPrefecture」というgemを利用して表示してみた
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
end
