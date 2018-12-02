class LevelTwo
  attr_accessor :player_icon

  def initialize(player_icon)
    @player_icon = player_icon
  end

  def scenario
    clear_screen
    puts "\t\t\t\t Chamber of Secrets - \tSupernatural Aid"
    puts 'You are kneeling the Chamber of Secrets. Tom Riddle has just revealed his true nature as Lord Voldemort to you.'
    puts 'Hope seems lost. Ginny is dying, Tom is standing triumphantly over you. he has procclaimed himself the greatest sorcerer of all time.'
    sleep(6)
    puts "You: You\'re not."
    sleep(3)
    puts 'Tom: Not what?'
    sleep(3)
    puts "You: Not the greatest sorcerer in the world. Albus Dumbledore is. You were scared of him then, and you\'re scared of him now."
    sleep(4)
    puts "You: You wouldn\'t dare try to take over this school with him here and you had to make sure he left before you came out."
    sleep(4)
    puts 'Riddle has an ugly look on his face.'
    sleep(3)
    puts "Tom: Dumbledore\'s been driven out of this castle by the mere memory of me!"
    sleep(4)
    puts "You: He's not as gone as you might think!"
    sleep(5)
    puts 'Suddenly a strange song fills the chamber. Fawkes the phoenix flies into the room carrying an old hat.'
    sleep(3)
    puts 'You see a glint of silver in the hat, and you pull out a magnificent, shining sword.'
    sleep(3)
    puts "Riddle turns to the chamber and starts hissing like a snake, but you know what he\'s saying."
    sleep(3)
    puts 'Tom: Speak to me, Slytherin, greatest of Hogwarts Four.'
    sleep(3)
    puts 'The chamber opens and an enormous snake crawls out. You turn away to avoid making eye contact.'
    sleep(3)
    puts 'Tom: Kill him.'
    sleep(3)
    puts 'The snake barely has a chance before Fawkes swoops down and claws its eyes out.'
    sleep(3)
    puts "Now's your time, fight the snake!! Press enter to begin the battle sequence."
    print_icon
    gets
    battle
    sleep(4)
    puts 'The basilisk is weak. It has trouble merely lifting its head up.'
    sleep(2)
    puts 'It tries to get up and slams its head against the chamber.'
    sleep(3)
    puts 'SLAM'
    sleep(2)
    puts 'The basilisk falls to the ground.'
    sleep(3)
    puts "The basilisk head lays wide open and the snake can barely move."
    sleep(2)
    puts 'You run up and stab through the roof of its mouth.'
    sleep(3)
    puts 'Blood spurts everywhere, but the basilisk moves no more.'
    sleep(3)
    puts 'A fang sticks out of your arm unfortunately. Without giving riddle the satisfication of a loss'
    puts 'you take the fang and stab through his diary. Ink pours out of the page and Riddle begins to disappear.'
    sleep(6)
    puts 'You have completed level two!'
    sleep(4)
  end

  def print_icon
    print @player_icon
  end

  def battle
    puts 'Battle Begin'
    hp_health = 3
    basilisk_health = 3
    print_icon
    cmd = gets.chomp
    until hp_health.zero? || basilisk_health.zero?
      if cmd.include?('man')
        print_commands
      elsif cmd.include?('stab')
        hp_health, basilisk_health = attack_snake(hp_health, basilisk_health)
      elsif cmd.include?('def')
        hp_health, basilisk_health = defend_against_snake(hp_health, basilisk_health)
      elsif cmd.include?('wait')
        hp_health, basilisk_health = wait_on_snake(hp_health, basilisk_health)
      elsif cmd.include?('run')
        hp_health, basilisk_health = run_from_snake(hp_health, basilisk_health)
      elsif cmd.include?('clear')
        clear_screen
      else
        puts 'That is not a valid command!'
      end
      cmd = prompt unless hp_health.zero? || basilisk_health.zero?
      print_and_exit if hp_health.zero?
    end
  end

  def clear_screen
    system 'cls'
    system 'clear'
  end

  def print_commands
    puts "Commands \t - \t Keyword"
    puts
    puts "Attack \t\t - \t stab"
    puts "Defend \t\t - \t def"
    puts "Wait \t\t - \t wait"
    puts "Run \t\t - \t run"
    puts "Clear screen \t - \t clear"
  end

  def prompt
    print_icon
    gets.chomp
  end

  def print_health(hp_health, bas_health)
    puts "Your health: #{hp_health}, Basilisk Health: #{bas_health}"
  end

  def print_and_exit
    puts 'Your health has been delepted. Game over.'
    puts 'Goodbye'
    exit(0)
  end

  def attack_snake(hp_health, bas_health)
    rng = Random.rand
    if rng > 0.4
      puts 'You slash at the basilisk and hurt it badly.'
      bas_health -= 1
      print_health(hp_health, bas_health)
    else
      puts 'You slash valiantly and miss the target.'
    end
    [hp_health, bas_health]
  end

  def defend_against_snake(hp_health, bas_health)
    rng = Random.rand
    if rng < 0.2
      puts 'You raise the sword in defense.'
      sleep(3)
      puts 'The basilisk tries to bite you but you block the attack and hurt it.'
      bas_health -= 1
      print_health(hp_health, bas_health)
    else
      puts 'You raise the sword in defense'
      sleep(3)
      puts 'The basilisk tries to bite you but misses.'
    end
    [hp_health, bas_health]
  end

  def wait_on_snake(hp_health, bas_health)
    rng = Random.rand
    puts 'You wait for the basilisk to move'
    if rng < 0.25
      puts 'The basilisk lunges at you but you dodge it just in time and respond with a slash.'
      bas_health -= 1
      print_health(hp_health, bas_health)
    elsif rng > 0.25 && rng <= 0.5
      puts 'The basilisk lunges at you and you dodge it, but miss on the counter attack.'
    else
      puts 'The basilisk lunges at you and manages to give you  nasty bite.'
      hp_health -= 1
      print_health(hp_health, bas_health)
    end
    [hp_health, bas_health]
  end

  def run_from_snake(hp_health, bas_health)
    rng = Random.rand
    if rng < 0.85
      puts 'You tried to run, but you trip and hurt yourself.'
      hp_health -= 1
      print_health(hp_health, bas_health)
      [hp_health, bas_health]
    else
      puts 'You tried to run but the basilisk is much quicker.'
      puts 'It swallows you whole.'
      puts 'You have lost the game! Goodbye!'
      exit(0)
    end
  end
end
