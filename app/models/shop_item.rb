class ShopItem < ApplicationRecord

  validates :name     , presence: true
  validates :item_type, presence: true

  mount_uploader :img, ImgUploader

  CRYPT_KEY = 'GhvmasdFkasdqkFKasd'

  self.per_page = 3

  def self.valid_item?(item_name)
    %w{ juice icecream }.include?( item_name.to_s )
  end

  def get_thumb_url
    self.img.try(:square_thumb).try(:to_s)
  end

end
