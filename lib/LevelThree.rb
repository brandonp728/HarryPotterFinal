class LevelThree
  attr_accessor :player_icon

  def initialize(player_icon)
    @player_icon = player_icon
  end

  def scenario
    clear_screen
    puts "\t\t\tPrisoner of Azkaban"
    puts 'You are looking out over a lake in the middle of the Forbidden Forest. You feel a chill from behind.'
    sleep(3)
    puts 'The edges of the lake start to freeze, and you turn to see Dementors swooping in from all sides.'
    sleep(2)
    puts 'They are rushing towards you and Sirius from the past, soon something will come and save you.'
    sleep(4)
    puts "But nothing is coming, and they\'re getting awfully close."
    sleep(3)
    puts 'You start to realize no one is coming...'
    sleep(2)
    puts 'What will you do?'
    print_icon
    prompt_and_handle_command
  end

  def print_icon
    print @player_icon
  end

  def clear_screen
    system 'cls'
    system 'clear'
  end

  def print_commands
    puts "Commands \t - \t Keyword"
    puts
    puts "Spells \t\t - \t spell"
    puts "Nothing \t - \t noth"
    puts "Run \t\t - \t run"
    puts "Clear screen \t - \t clear"
  end

  def print_spells
    puts "Spells \t\t\t - \t Keyword"
    puts
    puts "Expelliarmus \t\t - \t exp"
    puts "Expecto Patronum \t - \t pat"
    puts "Ridikkulus \t\t - \t rid"
  end

  def prompt_and_handle_command
    handle_command(gets.chomp)
  end

  def handle_command(cmd)
    tries = 5
    dementors = 3
    until tries.zero? || dementors.zero?
      man = false
      if cmd.include?('man')
        print_commands
        man = true
      elsif cmd.include?('spell')
        tries, dementors = cast_spell(tries, dementors)
      elsif cmd.include?('run')
        rng = Random.rand
        if rng < 0.85
          puts 'You try to run but you trip over a rock.'
          sleep(2)
          puts 'You get back up and face the lake'
          tries -= 1
        else
          puts 'You run away, leaving yourself and Sirius behind.'
          sleep(2)
          puts 'Oh well, you completely changed the future, but maybe you can give the time turner another spin.'
          sleep(5)
          puts 'Game over'
          sleep(4)
          exit(0)
        end
      elsif cmd.include?('noth')
        puts 'You do nothing, unwise in this situation'
        tries -= 1
      elsif cmd.include?('clear')
        clear_screen
      else
        puts 'Not a valid command!'
      end
      puts "You have #{tries} tries left and there are still #{dementors} dementor groups left" unless dementors.zero? || man
      bad_ending if tries.zero? && !dementors.zero?
      unless dementors.zero?
        print_icon
        cmd = gets.chomp
      end
    end
  end

  def cast_spell(tries, dementors)
    puts 'Select your spell'
    print_spells
    loop do
      print_icon
      spell = gets.chomp
      if spell.include?('exp')
        puts 'You: Expelliarmus!'
        sleep(3)
        puts 'You cast expelliarmus but it merely rustles the cloak of a passing dementor'
        tries -= 1
        break
      elsif spell.include?('pat')
        rng = Random.rand
        puts 'You: Expecto Patronum!'
        sleep(3)
        if rng < 0.65
          puts 'A silver stag erupts out the tip of your wand and charges at a group of dementors.'
          sleep(2)
          dementors -= 1
          if dementors.zero?
            puts 'The dementors have all been cleared! You have saved Sirius and yourself from the past'
            puts 'You have completed level 3!'
            sleep(7)
          else
            puts 'It attacks several of them and chases them away. Still a few more are around'
            sleep(3)
          end
          tries -= 1 unless dementors.zero?
        else
          puts 'But the spell failed'
          sleep(2)
        end
        break
      elsif spell.include?('rid')
        puts 'You: Ridikulus!'
        sleep(3)
        puts 'You cast ridikulus. It soars past a dementor and hits a tree.'
        puts 'A dementor turns and looks at you menacingly, before continuing to go towards you and Sirius.'
        tries -= 1
        break
      else
        puts 'Not a valid spell!'
      end
    end
    [tries, dementors]
  end

  def bad_ending
    puts "You could not save Sirius and yourself in time and Sirius\' soul has been removed."
    sleep(4)
    puts 'Game Over'
    exit(0)
  end
end
