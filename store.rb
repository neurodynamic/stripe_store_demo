require 'stripe'
require_relative 'stripe_config'

Stripe.api_key = $STRIPE_SECRET_TEST_KEY

# method definitions

def get_card_info
  card = {}
  puts "Enter your credit card number:"
  card[:number] = gets.chomp
  puts "Enter your expiration month:"
  card[:exp_month] = gets.chomp
  puts "Enter your expiration year:"
  card[:exp_year] = gets.chomp
  puts "Enter your CVC:"
  card[:cvc] = gets.chomp
  card
end

# driver code

card = get_card_info
