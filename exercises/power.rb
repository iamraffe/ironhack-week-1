def power(base, exponent)
	result = 1
	exponent.times do
		result = base * base
	end
	result
end

def reverse(user_input)
	user_input.reverse!
end

def factorial(number)
	result = 1
	while number > 0
		result = result * number
		number-=1
	end
	result
end

def time_conversion(minutes)
	hours=minutes/60
	minutes=minutes%60
	{hours: hours, minutes: minutes}
end

def count_vowels(sentence)
	puts sentence.scan(/[aeoui]/).count
end

def uniques(array)
	result = []
	result = array & array
	print "["
	result.size.times do |key|
		if(result.size == (key+1))
			print "#{result[key]}"
		else
			print "#{result[key]}, "
		end
	end
	puts "]"
end

def is_prime?(number)
	help = number - 1
	exit = false
	while !exit && help > 1
		if(number % help == 0)
			exit = true
		end
		help-=1
	end
	puts !exit
end

def palindrome?(word)
	is_palindrome = false
	if(word == reverse(word))
		is_palindrome = true
	end
	puts is_palindrome
end

def capitalize_words(sentence)
	sentence = sentence.split;
	sentence = sentence.map(&:capitalize).join(' ')
	puts sentence
end

def two_sum(array)
	response = { positive: false, negative: false}
	array.each_with_index do |val, key| 
		if(val.to_i < 0)
			i = key.to_i
			while i < array.size
				if(val.to_i == (array[i].to_i * -1))
					response[:positive] = key.to_i
					response[:negative] = i
				end
				i+=1
			end
		end
	end
	puts response
end

def greatest_common_factor(number, other_number)
	while other_number > 0
		number, other_number  = other_number, number % other_number
	end
	puts number
end

puts '''
Hello, my friend
Tell me, which exercise do you want to do?
1. Power
2. Reverse
3. Factorial
4. Time Conversion (Sounds way cooler than what it actually is)
5. Count vowels
6. Uniques
7. Is prime
8. Palindrome
9. Capitalize Words
10 Two Sum
11. Greatest Common Factor
12. Print Polynomials

------------------------------------------
'''

user_choice = gets.chomp

case user_choice.to_i
when 1
	puts "Give me a base"
	base = gets.chomp

	puts "Give me an exponent"
	exponent = gets.chomp

	result = power(base.to_i, exponent.to_i)

	puts "The power of #{base} to the #{exponent} is #{result}"
when 2
	puts "Give me a string to reverse"
	user_input = gets.chomp
	result = reverse(user_input)

	puts result
when 3
	puts "Give me the number you want to get the factorial"
	number = gets.chomp
	result = factorial(number.to_i)
	puts "The factoral of #{number} is #{result}"
when 4
	puts "Give me a bunch of minutes, I'll sort that out for you"
	minutes = gets.chomp
	result = time_conversion(minutes.to_i)
	puts "#{result[:hours]}:#{result[:minutes]}"
when 5
	puts "Give me a sentence, let me work my magic"
	sentence = gets.chomp
	count_vowels(sentence.downcase)
when 6
	puts "The array we are working with is [1,5,”frog”, 2,1,3,”frog”]"
	uniques([1,5,"frog", 2,1,3,"frog"])
when 7
	puts "Give me a number, I'll tell you if it's prime"
	number = gets.chomp
	is_prime?(number.to_i)
when 8
	puts "Give me a word bro"
	word = gets.chomp
	palindrome?(word)
when 9
	puts "Give me a sentence homie"
	sentence = gets.chomp
	capitalize_words(sentence)
when 10
	puts "The array we are working with is [1,-8,-5,2,3,5,4,-6]"
	array = [1,-8,-5,2,3,5,4,-6]
	two_sum(array)
when 11
	puts "Give me a number homie"
	number = gets.chomp
	puts "Give me another number my man"
	other_number = gets.chomp
	greatest_common_factor(number.to_i.abs, other_number.to_i.abs)
when 12
	puts "We are using this array [-3,-4,1,0,6]"
	array = [-3,-4,1,0,6]
	polynomial(array)
else
	"My friend please provide a valid option number"
end
