class Order < ApplicationRecord

  belongs_to :user

  validates :code, presence: true
  validates :user, presence: true

  def self.place_an_order cart, user_id
    success = false

    if user_id.present? && cart.present?
      item_ids  = ShopItem.where(id: cart).pluck(:id).join(',')
      ord       = Order.create user_id: user_id, code: item_ids
      p ord
      puts ord.errors.messages
      success = true if ord && ord.id.present?
    end

    success
  end

end
