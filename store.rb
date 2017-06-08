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

def stringify_to_dollars(cents)
  # The line below is a little advanced ...
  # run it individually to find out what it does (new skill!),
  # then move on with your life.
  dollars = '%.2f' % (cents / 100.0)
  "$#{dollars}"
end

# driver code

card = get_card_info
p stringify_to_dollars(250)
