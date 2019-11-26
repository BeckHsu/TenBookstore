class Book < ApplicationRecord
    # validates
    validates :title, presence: true
    validates :isbn, presence: true, uniqueness: true
    validates :isbn13, presence: true, uniqueness: true
    validates :list_price, :sell_price, :page_num ,numericality: {greater_than: 0}
    
    # relationships
    has_one_attached :cover_image
    belongs_to :publisher, optional: true #publisher_id

    # def self.available
    #     where(on_sell: true).where('list_price>0')
    # end
    # scope
    scope :available, ->{where(on_sell: true).where('list_price>0')}
end
