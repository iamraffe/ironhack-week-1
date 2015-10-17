class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

def print_menu
		puts'''

====================================

What do you wanna do now?
1. Sort by price (Highest first)
2. Capacity
3. Filter by city
[To exit type: EXIT]

====================================

'''
end

def average_price(homes)
	prices_array = homes.map{|home| home.price}
	prices_average = prices_array.reduce(0.0) do |average, price|
										average + (price.to_f/homes.size)
									end

	puts "\nPrice average: #{prices_average}$"

end

def name_your_own(homes, price)
	priced_homes = homes.find do |home|
		home.price == price
	end

	puts priced_homes.class
	if(priced_homes.size == 1)
		puts priced_homes.name + " in " + priced_homes.city 
		puts "Price: $#{priced_homes.price} a night"
		puts "Capacity: #{priced_homes.capacity} human beings"
	else
		print_homes(priced_homes)
	end
end

def handle_input(user_input, homes)
	case user_input.to_i
		when 1
			sort_highest_first(homes)
		when 2
			sort_by_capacity(homes)
		when 3
			puts "Tell me a city to filter my brotha"
			city = gets.chomp
			filter_by_city(homes, city.downcase)
		when 4
			puts "Name your own price"
			price = gets.chomp
			name_your_own(homes, price.to_i)
	end
end

def print_homes(sorted_homes)
	sorted_homes.each do |home| 
		puts home.name + " in " + home.city 
		puts "Price: $#{home.price} a night"
		puts "Capacity: #{home.capacity} human beings"
	end
	average_price(sorted_homes)
end

def sort_highest_first(homes)
	sorted_homes = homes.sort{ |x,y| y.price <=> x.price}
	print_homes(sorted_homes)
end

def sort_by_capacity(homes)
	sorted_homes = homes.sort{ |x,y| x.capacity <=> y.capacity}
	print_homes(sorted_homes)
end

def filter_by_city(homes, city)
	filtered_homes  = homes.select do |home|
		if home.city.downcase == city
			home
		end
	end

	if(filtered_homes.size == 0)
		puts "No results by that city!"
	else
		puts "\nThis are your results:\n "
		print_homes(filtered_homes)
	end

end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Rafa's place", "San Antonio", 4, 49),
  Home.new("Victor's place", "Santo Domingo", 6, 52),
  Home.new("Andrea's place", "Stockholm", 5, 37),
  Home.new("Nacho's place", "London", 2, 61),
  Home.new("Pepe's place", "New York", 1, 55),
  Home.new("Ariel's place", "San Juan", 7, 49)
]

sorted_homes = homes.sort{ |x,y| x.price <=> y.price}

print_homes(sorted_homes)

user_input = ''
while user_input.downcase != "exit"
	print_menu
	user_input = gets.chomp
	handle_input(user_input.to_i, homes)
end
# sorted_homes = homes.sort{ |x,y| y.price <=> x.price}

# prices_array = homes.map{|home| home.price}
# prices_total = prices_array.reduce(:+)
# prices_average = prices_total/homes.size

# prices_average = prices_array.reduce(0.0) do |average, price|
# 									average + (price.to_f/homes.size)
# 								end

# puts "\nPrice average: #{prices_average}$"
