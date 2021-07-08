class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    # << Subscription.create(magazine, price)
    Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
  end

  def total_subcription_price
    self.subscriptions.map{|subscription| subscription.price}.sum
  end

  def cancel_subscription(magazine)
    # self.subscriptions.find{|subscription| destroy(subscription.magazine == magazine)}
    # self.subscriptions.find{|subscription| subscription.magazine == magazine}.destroy
    self.subscriptions.find_by(magazine_id: magazine.id).destroy

  end
end

mag1 = Magazine.first
reader1 = Reader.first