# rps.rb
# Rock Paper Scissors Game
# Rules: Rock beats Scissors, Scissors beats Paper, 
#        Paper beats Rock, otherwise a tie

# Player and computer options - 
# r, p, s - " rock", "paper", "scissors"
#
# TO DO: Add best of games, keep track of scores
# TO DO: 'results' method - Print out 'Rock', 'Paper'
#        'Scissors' instead of r, p, s
def set_options 
  @options = ['r', 'p', 's']
  @picks = []
end

def header 
  puts "Let's play Rock Paper Scissors!"
end

def usr_select
  print "Choose one: (R/P/S) => "
  @usr_pick = gets.chomp.downcase
  valid_usr_pick?
end

def valid_usr_pick?
  case @usr_pick
  when 'r', 'p', 's'
    @usr_pick
  else
    puts "Invalid. "
    usr_select
  end
end

def pc_select
  @pc_pick = @options.sample
end


def result pick
# TO DO list: Modify to print out rock, paper or scissors
  case pick 
  when ['r', 's'], ['s', 'p'], ['p', 'r']
    puts "You win! "
  when ['r', 'r'], ['s', 's'], ['p', 'p']
#  when pick.first == pick.last
    puts "It's a tie! "
  else
    puts "Computer win! "
  end
end

def play_again?
  puts "Play again? (y or n) "
  play = gets.chomp.downcase

  if play == 'y' || play == "yes"
    main
  elsif play == 'n' || play == "no"
    puts "Alright. Goodbye. "
    exit
  else 
    puts "Sorry. I don't understand. "
    play_again?
  end
end

# main program
def main
  set_options 
  header
  usr_select
  pc_select

# add user and pc inputs to picks array
  @picks << @usr_pick
  @picks << @pc_pick
  p @picks            # print for testing purposes

  result @picks
  play_again?
end

# Main program launch
main
# End of file
