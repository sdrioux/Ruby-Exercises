# class	User
# 	def age=(my_age)
# 		puts "Setting age to #{my_age}"
# 		@age = my_age
# 	end

# 	def say_hello
# 		puts "Hello, you are #{@age}"
# 	end

# class User
# 	attr_accessor :age, 
# 			:name, :title, :veggie, :fruit

				# def age =(age)
				# 	@age = age
				# end

				# def age
				# 	@age
				# end

# 	def welcome
# 		puts "Welcome #{@title} #{@name}.  You are #{@age} years old. If you could be a fruit, you'd be #{@fruit}. If you were a veggie, obviously you'd be #{@veggie}"
# 	end

# 	def display_veggie
# 		puts @veggie
		
# 	end
# end

class Car

	attr_accessor :color, :gas, :miles_driven

	def initialize
		@gas=100
	end

	def change_color(color_name)
		@color = color_name
		
	end

	def fill_gas(amount_gas)
		@gas += amount_gas
	end

	def drive(miles_driven)
		@miles_driven += miles_driven
		@gas -= 0.5 * miles_driven
		# @miles_driven += 
		if @gas <= 0
			puts "you're out of gas"
			
		end
	end



end
