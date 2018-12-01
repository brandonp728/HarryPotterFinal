require_relative 'LevelOne'
require_relative 'LevelTwo'

class Game
  attr_accessor :player_icon
  
  def determine_icon(player_name)
    @player_icon = '$'
    (0...player_name.size).each do |i|
      begin
        @player_icon += player_name.chars[i] if (i % 2).zero?
      rescue StandardError
        @player_icon += '&'
      end
    end
    @player_icon += '>'
  end

  def start_screen
    clear_screen
    puts 'Welcome to Harry Potter the game!'
    puts 'Ready for adventure, action, and analysis? Y / N'
    puts 'Press Y to begin your journey'
    answer = gets.chomp
    print_and_exit unless answer.downcase.include?('y')
  end

  def print_and_exit
    puts 'Goodbye!'
    exit(0)
  end

  def print_icon
    print @player_icon
  end

  def clear_screen
    system 'cls'
    system 'clear'
  end

  def play
    start_screen
    puts 'Lets begin!'
    puts 'What is your name? Maximum of 15 characters, no spaces'
    player_name = gets.chomp
    while player_name.size > 15
      puts 'That is too big! Enter again'
      player_name = gets.chomp
      print_and_exit if player_name.include?(' ')
    end
    print_and_exit if player_name.include?(' ')
    puts 'Welcome ' + player_name + '!'
    determine_icon(player_name)
    puts 'Each level will have different commands that can be typed to interact with the story.'
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    puts 'Here is your player icon, press enter to continue'
    print_icon
    gets
    puts 'Starting Level 1'
    sleep(1)
    level_one = LevelOne.new(player_icon)
    level_one.scenario
    print_icon
    gets
    puts 'Starting Level 2'
    level_two = LevelTwo.new
    level_two.scenario
  end
end
