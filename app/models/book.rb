class Book < ApplicationRecord

    validates :title, presence: true
    validates :isbn, presence: true, uniqueness: true
    validates :isbn3, presence: true, uniqueness: true
    validates :list_price, :sell_price, :page_num ,numericality: {greater_than: 0}


end
