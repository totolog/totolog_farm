class Tag < ApplicationRecord
    has_many :products, through: :product_tags
    has_many :product_tags, dependent: :delete_all
end
