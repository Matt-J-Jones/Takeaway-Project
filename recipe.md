# User stories:

As a customer
So that I can *check* if I want to order something
I would like to *see* a list of dishes with prices.

As a customer
So that I can *order* the meal I want
I would like to be able to *select* some number of several available dishes.

As a customer
So that I can *verify* that my order is correct
I would like to *see* an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to *receive* a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

# Menu
  - view items & prices
  - show avalibility 
  - select items to order

# Billing
  - receive order list & prices
  - show itemised receipt and total
  - place order

# Tracking
  - receive confirmation
  - receive estimated delivery time

Menu.rb -> selected items -> Order.rb -> full order -> Billing.rb -> order confirmation -> Tracking.rb

# Program flow:

Menu.rb Shows list of items and their avalibility, from this the user can select which items they want to order. As they select each item from the list, it is passed onto Order.rb which collates the total order and it's running total. When the user has finished their order Order.rb passes the full list to Billing.rb which displays the itemised receipt and grand total. When the user confirms the order, the confirmation is passed to Tracking.rb and the order confirmation information, and estimated delivery time, is sent to the user.
