# use sets
require 'set'

def display(minefield)
  puts
	0.upto(minefield.count-1) do |x|
	   puts minefield[x].join(" ")
	end
  puts
end

def mine_sweeper  # irb wrapper

# define mine field
 # minefield = [
 #     [false, false, false, false], # 0
 #     [false, false, false, false], # 1
 #     [false, false, false, false], # 2
 #     [false, false, false, false]  # 3
 #   ]
minefield = []
puts "How many rows do you want in your minefield?"
rows = gets.chomp.to_i
puts "How many columns do you want in your minefield?"
columns = gets.chomp.to_i

minefield = Array.new(rows,Array.new(columns,false))

display(minefield)

minefield_display = []

rows.times{
  array=[]
    columns.times{array.push(0)
    }
    minefield_display.push(array)
}
    #   [0,0,0,0],  # 0
    #   [0,0,0,0],  # 1
    #   [0,0,0,0],  # 2
    #   [0,0,0,0]  # 3
    # ]

# count space
number_of_spaces_on_field = minefield.flatten.count

system 'clear'

3.times {puts} 
puts "         WELCOME TO MINESWEEPER       "
puts
puts "           by Silas and Sonny    "
3.times {puts}

# ask how many mines desired
puts "How many mines would you like on the field? (from 1 to #{number_of_spaces_on_field})"

#There cannot be more putsmines than you have spaces
answer = gets.chomp.to_i
until answer <= number_of_spaces_on_field
  puts "You can't have more mines than you have spaces!"
  answer = gets.chomp.to_i
end
number_of_mines_on_field = answer

# populate mine field

mines_on_field = Set.new

until mines_on_field.size >= number_of_mines_on_field
	  # Grab a random number,
	  # no greater than the number of spaces on the field.
	  # For a 16-space square,
	  # * 0  => the top left corner
	  # * 3  => the top right corner
	  # * 7  => the bottom left corner
	  # * 11 => the bottom right corner
	  space_number_for_mine = rand(number_of_spaces_on_field)  # offset for 0-based arrays

	  # puts "space = #{space_number_for_mine}"

	  mines_on_field.add(space_number_for_mine)
end


   mines_on_field.each do |mine_number|
     minefield_row_number = mine_number / minefield[0].count
     minefield_column_number = mine_number % minefield.count
     minefield_row = minefield[minefield_row_number] # This is like minefield[0]
     minefield_row[minefield_column_number] = true   # This is like minefield[0][3] = true
   end
   puts
   puts "Good luck!"
   puts
   # display(minefield)
   # 4.times{puts}

   display(minefield_display)

   puts "Please select a row from 0 to #{minefield.count-1}"
   i = gets.chomp.to_i
   while i > (minefield.count-1)
      puts "That number is not between 0 and #{minefield.count-1}"
      puts "Please select a row from 0 to #{minefield.count-1}"
      i = gets.chomp.to_i
   end

   puts "Please select a column from 0 to #{minefield[0].count-1}"
   j = gets.chomp.to_i
   while j > (minefield[0].count-1)
      puts "That number is not between 0 and #{minefield[0].count-1}"
      puts
      puts "Please select a column from 0 to #{minefield[0].count-1}"
      j = gets.chomp.to_i
   end

   until minefield[i][j] or minefield_display.flatten.count(0)-1==minefield.flatten.count(true)

    if minefield_display[i][j] == "X"
      puts
      puts "You've already selected this space, bud!"
      puts
    else
      minefield_display[i][j] = "X"
      display(minefield_display)
   		puts "Whew... no mine, still alive"
      puts
    end

	   puts "Please select another row from 0 to #{minefield.count-1}"
	   i = gets.chomp.to_i
      while i > (minefield.count-1)
        puts "That number is not between 0 and #{minefield.count-1}"
        puts "Please select a row from 0 to #{minefield.count-1}"
        i = gets.chomp.to_i
      end

	   puts "Please select another column from 0 to #{minefield[0].count-1}"
	   j = gets.chomp.to_i
      while j > (minefield[0].count-1)
        puts "That number is not between 0 and #{minefield[0].count-1}"
        puts
        puts "Please select a column from 0 to #{minefield[0].count-1}"
        j = gets.chomp.to_i
      end

   end

if minefield[i][j]
   puts <<-EOS

     _.-^^---....___
 _--                 ^--_
<                        >)
|                         |
 .                        .
  .._                  _..
    ```--. . , ; .--'''
          | |   |
       .-=||  | |=-.
       `-=|-*-*-|=-'
          | ;  :|
 _____.,--#$&$@$$#--,._____c

EOS

puts "Play again?(Y/N)"
  if gets.chomp.upcase =="Y"
  mine_sweeper
  end
else

puts "YOU WIN!!"
3.times{puts}
puts "Play again?(Y/N)"
  if gets.chomp.upcase =="Y"
  mine_sweeper
  end
end


#irb wrapper
end
