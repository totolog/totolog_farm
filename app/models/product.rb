class Product < ApplicationRecord
    has_many :images, dependent: :destroy
    accepts_nested_attributes_for :images

    has_many :product_tags, dependent: :delete_all
    has_many :tags, through: :product_tags
    # accepts_nested_attributes_for :tags, allow_destroy: true

    belongs_to :farmer

    has_many :cart_items

    default_scope -> {order(create_at: :desc)}


    validates :name, presence: true, uniqueness: true
    validates :content, presence: true
    validates :comment, presence: true
    validates :count, presence: true
    validates :category, presence: true

end
