peeps = [{name: "Alex Rodriguez", age: 35},{name: "LaTroy Hawkings", age: 40},{name: "Pete Rose", age: 65},{name: "Mike Rizzo", age: 18}]

result = peeps.select do |people|
	people[:age]>25 && people[:age]<40
end

puts result