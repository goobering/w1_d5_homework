def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, cash)
  pet_shop[:admin][:total_cash] += cash
  return total_cash(pet_shop)
end

def add_or_remove_customer_cash(customer, cash)
  customer[:cash] += cash
  return customer[:cash]
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_pets)
  pet_shop[:admin][:pets_sold] += num_pets
  return pets_sold(pet_shop)
end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, breed)
  breed_collection = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_collection.push(pet)
    end
  end
  return breed_collection
end

def find_pet_by_name(pet_shop, name)
  name_collection = []
  for pet in pet_shop[:pets]
    if pet[:name] == name
      name_collection.push(pet)
    end
  end
  return name_collection.first()
end

def remove_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(find_pet_by_name(pet_shop, name))
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return (customer[:cash] - new_pet[:price] > 0)
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet_shop[:pets].include?(pet)
    if customer_can_afford_pet(customer, pet)
      add_pet_to_customer(customer, pet)
      remove_pet_by_name(pet_shop, pet)
      add_or_remove_cash(pet_shop, pet[:price])
      add_or_remove_customer_cash(customer, pet[:price])
      pet_shop[:admin][:pets_sold] += 1
    end
  end
end

