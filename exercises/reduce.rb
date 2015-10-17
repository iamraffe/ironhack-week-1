require "pry"
cities = %w"caracas paris madrid lisbon alejandria"

result = cities.reduce do |longest_city, city|
					if longest_city.length < city.length
						city
					else
						longest_city
					end
				end

#result = cities.reduce{|longest_city, city| longest_city.length > city.length ? longest_city : city}

puts result