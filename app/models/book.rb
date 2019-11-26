class Book < ApplicationRecord

    validates :title, presence: true
    validates :isbn, presence: true, uniqueness: true
    validates :isbn13, presence: true, uniqueness: true
    validates :list_price, :sell_price, :page_num ,numericality: {greater_than: 0}
    

    has_one_attached :cover_image
    belongs_to :publisher, optional: true #publisher_id

end
