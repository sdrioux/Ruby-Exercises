#encoding: utf-8

cards_in_deck =[
["♥",2,2],["♥",3,3],["♥",4,4],["♥",5,5],["♥",6,6],["♥",7,7],["♥",8,8],["♥",9,9],["♥",10,10],["♥","J",10],["♥","Q",10],["♥","K",10],["♥","A",11],
["♦",2,2],["♦",3,3],["♦",4,4],["♦",5,5],["♦",6,6],["♦",7,7],["♦",8,8],["♦",9,9],["♦",10,10],["♦","J",10],["♦","Q",10],["♦","K",10],["♦","A",11],
["♠",2,2],["♠",3,3],["♠",4,4],["♠",5,5],["♠",6,6],["♠",7,7],["♠",8,8],["♠",9,9],["♠",10,10],["♠","J",10],["♠","Q",10],["♠","K",10],["♠","A",11],
["♣",2,2],["♣",3,3],["♣",4,4],["♣",5,5],["♣",6,6],["♣",7,7],["♣",8,8],["♣",9,9],["♣",10,10],["♣","J",10],["♣","Q",10],["♣","K",10],["♣","A",11]
]
#MY HAND
my_hand = cards_in_deck.sample(2)  #take two random cards from the deck.
my_total = my_hand[0][2]+my_hand[1][2]
cards_in_deck.delete_if{|card| card==my_hand[0] or card==my_hand[1]}  #remove those cards from the pack

#DEALERS HAND
dealers_hand = cards_in_deck.sample(2)
dealers_total = dealers_hand[0][2]+dealers_hand[1][2]
cards_in_deck.delete_if{|card| card==dealers_hand[0] or card==dealers_hand[1]}

system('cls')
puts
print "Your hand: " 
0.upto(my_hand.count-1){|x| print "| #{my_hand[x][1]}#{my_hand[x][0]} |  "}
puts
puts "Your total = #{my_total}."
2.times{puts}
print "Dealer's hand: | ?? |  "
1.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}
puts
puts "Dealer shows #{dealers_hand[1][2]}"
puts
puts "Do you want to hit or stand?"
while gets.chomp.downcase == "hit" 
  my_hand.push(cards_in_deck.sample(1)[0])
  cards_in_deck.delete_if{|card| card==my_hand.last}
  my_total+=my_hand.last[2]
print "Your hand: " 
0.upto(my_hand.count-1){|x| print "| #{my_hand[x][1]}#{my_hand[x][0]} |  "}
puts
puts "Your total = #{my_total}."
2.times{puts}
print "Dealer's hand: | ?? |  "
1.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}
puts
puts "Dealer shows #{dealers_hand[1][2]}"
  if my_total > 21
    puts "BUST!  Play Again? (Y/N)"
      if gets.chomp.downcase == "y"
          load 'blackjack.rb'
      else
          exit
      end
  end
puts "Your total = #{my_total}.  Do you want to hit or stand?"
end

print "Dealer's hand: "
0.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}

#if the dealer busts
# while dealers_total > 21
#   if dealers_hand.any? {|card| card[1] == "A" and card[2] == 11}
#     dealers_total-=10
#     dealers_hand.find.map! { |card| card[1]== "A" and card[2] ==11 ? card[2]==1}
#         card[2]==1
#       end
#     end
#   redo
#   end
#   print "Dealer's hand: "
#   0.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}
#   puts "DEALER BUSTS!  YOU WIN!  Play Again? (Y/N)"
#   if gets.chomp.downcase =="y"
#       load 'blackjack.rb'
#   else
#       exit
#   end
# end

while dealers_total < 17
  puts "Dealer takes a card."
  dealers_hand.push(cards_in_deck.sample(1)[0])
  cards_in_deck.delete_if{|card| card==dealers_hand.last}
  dealers_total+=dealers_hand.last[2]
  print "Dealer's hand: "
  0.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}
end

while dealers_total > 21
  if dealers_hand.any? {|card| card[1] == "A" and card[2] == 11}
    dealers_total-=10
    dealers_hand.each do |card|
      if card[1] == "A" and card[2] ==11
        card[2]==1
      end
    end
  redo
  end
  print "Dealer's hand: "
  0.upto(dealers_hand.count-1){|x| print "| #{dealers_hand[x][1]}#{dealers_hand[x][0]} |  "}
  puts "DEALER BUSTS!  YOU WIN!  Play Again? (Y/N)"
  if gets.chomp.downcase =="y"
      load 'blackjack.rb'
  else
      exit
  end
end

if dealers_total > my_total
  puts "You lose!  Dealer's #{dealers_total} beats your #{my_total}."
elsif dealers_total == my_total
  puts "Push.  You keep your bet."
else
  puts "You win!  Your #{my_total} beats the dealer's #{dealers_total}."
end

puts "Play Again? (Y/N)"
load 'blackjack.rb' if gets.chomp.downcase =="y"
