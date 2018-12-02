require_relative 'LevelOne'
require_relative 'LevelTwo'
require_relative 'LevelThree'

class Game
  attr_accessor :player_icon

  def determine_icon(player_name)
    not_include = ['a', 'e', 'i', 'o', 'u', ' ']
    @player_icon = '$'
    player_name.chars.each do |char|
      begin
        @player_icon += char unless not_include.include?(char)
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

  def check_player_size(player_name)
    while player_name.size > 20
      puts 'That is too big! Enter again'
      player_name = gets.chomp
    end
    player_name
  end

  def play
    start_screen
    puts 'Lets begin!'
    puts 'What is your name? Maximum of 20 characters'
    player_name = gets.chomp
    player_name = check_player_size(player_name)
    puts 'Welcome ' + player_name + '!'
    determine_icon(player_name)
    puts 'Each level will have different commands that can be typed to interact with the story.'
    puts 'Type ls to go the level selector.'
    puts 'Otherwise just hit enter to start the story mode.'
    print_icon
    cmd = gets.chomp
    level_select if cmd.include?('ls')
    levels_in_order
  end

  def levels_in_order
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    start_level_one
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    print_icon
    gets
    start_level_two
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    print_icon
    gets
    start_level_three
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    print_icon
    gets
    exit(0)
  end

  def level_select
    puts 'Enter a number 1 - 7 to go to that respective level.'
    loop do
      list_levels
      print_icon
      level = gets.chomp.to_i
      decide_level(level)
    end
  end

  def list_levels
    clear_screen
    puts 'If you are stuck at any time during a level, you can always type man to see the manual.'
    puts "Level 1 - Philosopher\'s Stone"
    puts 'Level 2 - Chamber of Secrets'
    puts 'Level 3 - Prisoner of Azkaban'
    puts 'Level 4 - Goblet of Fire'
    puts 'Level 5 - Order of the Phoenix'
    puts 'Level 6 - Half Blood Prince'
    puts 'Level 7 - Dealthy Hallows'
    puts 'Enter -1 to quit'
  end

  def decide_level(level)
    case level
    when 1
      start_level_one
    when 2
      start_level_two
    when 3
      start_level_three
    when -1
      print_and_exit
    else
      puts 'Not a valid command.'
    end
  end

  def start_level_one
    puts 'Starting Level 1'
    sleep(1)
    level_one = LevelOne.new(@player_icon)
    level_one.scenario
  end

  def start_level_two
    puts 'Starting Level 2'
    sleep(1)
    level_two = LevelTwo.new(@player_icon)
    level_two.scenario
  end

  def start_level_three
    puts 'Starting Level 3'
    sleep(1)
    level_three = LevelThree.new(@player_icon)
    level_three.scenario
  end
end
