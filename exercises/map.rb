peeps = [{name: "Alex Rodriguez", age: 35},{name: "LaTroy Hawkings", age: 40},{name: "Pete Rose", age: 65},{name: "Mike Rizzo", age: 18}]

cities = %w"caracas paris madrid lisbon"

result = peeps.select{|people| people[:age]>25}.map{|people| people[:name]}

#result = peeps.map{|people|  people[:name] if people[:age]>25}.select{|people| people}

#result = cities.map{|city| city.capitalize}

puts result