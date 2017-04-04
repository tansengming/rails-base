class PaymentRequired
  def self.call(user)
    !user.paid_until || user.paid_until < Time.now
  end
end