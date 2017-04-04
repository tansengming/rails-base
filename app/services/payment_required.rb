class PaymentRequired
  def self.call(user)
    !user.active_until || user.active_until < Time.now
  end
end