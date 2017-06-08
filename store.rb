require 'stripe'
require_relative 'stripe_config'

Stripe.api_key = $STRIPE_SECRET_TEST_KEY
