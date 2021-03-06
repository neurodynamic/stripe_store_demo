require 'stripe'
require_relative 'stripe_config'

Stripe.api_key = $STRIPE_SECRET_TEST_KEY

# method definitions
# this is a test change

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

def run_charge(user_card, amount)
  puts "-" * 10    # this just prints "----------"
  puts
  puts "The charge method would run here,"
  puts "but there's not much logic here yet."
  puts "You'll add that later!"
  puts "It would use this card info:"
  puts "Card number: #{user_card[:number]}"
  puts "Card exp: #{user_card[:exp_month]}/#{user_card[:exp_year]}"
  puts "Card cvc: #{user_card[:cvc]}"
  puts
  puts "And it would use this amount:"
  puts
  p amount
  puts "-" * 10
  # TODO: Create a Stripe token
  # TODO: Use the token to create a Stripe charge
  puts "Your card has been charged #{stringify_to_dollars(amount)}."
end

def get_user_choice(products)
  puts "AVAILABLE PRODUCTS"
  products.each_with_index do |product, index|
    puts "#{index + 1}. #{product[:description]} - #{stringify_to_dollars(product[:price])}"
  end
  puts "Enter the number of the product you want to buy:"
  index = gets.to_i - 1
  products[index]
end

# driver code

products = [
  {description: "dog", price: 2125},
  {description: "cat", price: 1999},
  {description: "hamster", price: 500},
  {description: "tarantula", price: 1275}
]

choice = get_user_choice(products)
card = get_card_info
p stringify_to_dollars(250)
run_charge(card, 250)
