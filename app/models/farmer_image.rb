class FarmerImage < ApplicationRecord
  belongs_to :farmer

  validates :farmer_logo, presence: true
  validates :farmer_image, presence: true

  mount_uploader :farmer_logo, FarmerLogoUploader
  mount_uploader :farmer_image, FarmerImageUploader
end
