Stripe.product :test_product_no_type do |product|
  product.name        = 'Acme as a service PRIMO'
  product.active      = true
  product.attributes  = ['size', 'gender']
  product.metadata    = {:number_of_awesome_things => 5}
  product.statement_descriptor = 'PRIMO'
  product.description = 'One step beyond supreme'
end
