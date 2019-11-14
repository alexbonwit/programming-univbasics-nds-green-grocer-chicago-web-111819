require 'pry'

def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  counter = 0
  
  while counter < collection.length do
    if collection[counter][:item] == name
      return collection[counter]
    end
    counter += 1
  end
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  
  consolidated_cart = []
  counter = 0
  
  while counter < cart.length do
    new_cart_item = find_item_by_name_in_collection(cart[counter][:item], consolidated_cart)
    if new_cart_item
      new_cart_item[:count] += 1
    else
      new_cart_item = {
        :item => cart[counter][:item],
        :price => cart[counter][:price],
        :clearance => cart[counter][:clearance],
        :count => 1
      }
      consolidated_cart << new_cart_item
    end
    # if find_item_by_name_in_collection(cart[counter][:item], consolidated_cart)
    #   added_item  = find_item_by_name_in_collection(cart[counter][:item], consolidated_cart)
    #   added_item[:count] += 1
    # else
    #   cart[counter][:count] = 1
    #   consolidated_cart << cart[counter]
    # end
    counter += 1
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  
  # binding.pry
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  
  #consolidated_cart array and coupons array will be arguments
  #need to output a changed consolidated_cart array with coupon values as prices.
  #coupons only affect the *number* of items listed on the coupon. Any additional items are regular price.
  #Conditions: Coupon must match item in cart, and number of items must meet or exceed coupon's number of items
  
  counter = 0
  
  while counter < coupons.length do
    cart_item = find_item_by_name_in_collection(coupons[counter][:item], cart)
    couponed_item_name = "#{coupons[counter][:item]} W/COUPON"
    cart_item_with_coupon = find_item_by_name_in_collection(couponed_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[counter][:num]
      if cart_item_with_coupon
        cart_item_with_coupon[:count] += coupons[counter][:num]
        cart_item[:count] -= coupons[counter][:num]
      else
        cart_item_with_coupon = {
          :item => couponed_item_name,
          :price => coupons[counter][:cost] / coupons[counter][:num],
          :clearance => cart_item[:clearance],
          :count => coupons[counter][:num]
        }
        cart << cart_item_with_coupon
        cart_item[:count] -= coupons[counter][:num]
      end
    end
    
    counter += 1
  end
  
  cart
  
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  counter = 0
  
  while counter < cart.length do
    if cart[counter][:clearance] == true
      cart[counter][:price] = (cart[counter][:price] - cart[counter][:price] * .20).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
