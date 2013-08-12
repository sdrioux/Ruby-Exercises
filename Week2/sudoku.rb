puts "Enter the numbers in the sudoku puzzle"

input = gets.chomp.to_i
while input.size !=81
	puts "Incorrect amount of numbers.  You need 81 numbers, you have #{input.count}!"
	puts "Try again."
	input = gets.chomp
end
puzzle=input.scan(/.{8}/)

# puzzle=<<EOS
# 045803710
# 810000024
# 709000508
# 000907000
# 000060000
# 000402000
# 604000305
# 320000087
# 057308260
# EOS

sudoku=[]
#Takes each line of the puzzle and splits it into its own array of single digits
puzzle.each_line{|line|sudoku.push(line.scan(/\d/).map{|x|x.to_i})}
digits=[1,2,3,4,5,6,7,8,9]

#print out the puzzle as it exists at the start
puts
puts "Starting Puzzle:"
puts
0.upto(8) {|n|puts sudoku[n].join(" ")}
puts
puts
#The solver will continue to try to solve the puzzle for as long as there are 0s
while sudoku.flatten.include?(0)

0.upto(8){|x|
   0.upto(8){|y|

if sudoku[x][y]==0
solveddigits=[]

#add horizontal numbers
solveddigits.push(sudoku[x])


#add vertical numbers
0.upto(8){|z| solveddigits.push(sudoku[z][y])}


#add boxed numbers
if [0,3,6].include?(y)
    basey=y
elsif [1,4,7].include?(y)
    basey=(y-1)
else
    basey=(y-2)
end

if [0,3,6].include?(x)
    basex=x
elsif [1,4,7].include?(x)
    basex=(x-1)
else
    basex=(x-2)
end

0.upto(2){|xplus|
0.upto(2){|yplus|
solveddigits.push(sudoku[basex+xplus][basey+yplus])}}

#remove multiples and 0
solveddigits.flatten!.uniq!.reject!{|n|n==0}


remaining=digits-solveddigits

sudoku[x][y]=remaining if remaining.size==1

end

}}

end
#Print out the solved puzzle
puts "Solved Puzzle:"
puts
0.upto(8) {|n|puts sudoku[n].join(" ")}