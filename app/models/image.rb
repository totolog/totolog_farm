class Image < ApplicationRecord
    validates :img1, presence: true

    belongs_to :product

    mount_uploader :img1, Img1Uploader
    mount_uploader :img2, Img2Uploader
    mount_uploader :img3, Img3Uploader
    mount_uploader :img4, Img4Uploader
    mount_uploader :img5, Img5Uploader
end
