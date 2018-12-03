class LevelFour
  attr_accessor :player_icon, :ron, :hostages

  def initialize(player_icon, ron = false)
    @player_icon = player_icon
    @ron = ron
    @hostages = { 'ron' => 'Ron       ', 'herm' => 'Hermione', 'cho' => 'Cho       ', 'gab' => 'Gabrielle' }
    @cho_saved = false
    @herm_saved = false
    @gab_saved = false
  end

  def scenario
    clear_screen
    puts "\t\tGoblet of Fire \t - \t Road of Trials"
    puts 'You have been selected as the surprise fourth champion in the Triwizard Tournament.'
    sleep(3)
    puts "You aren\'t sure how your name ended up in the Goblet of Fire, but you have"
    puts 'no choice but to compete. The First Task is upon you. Press enter to begin.'
    print_icon
    gets
    first_task
    clear_screen
    sleep(2)
    puts 'Good job on passing the first task! But now the second task has come, are you ready?'
    puts 'Press Enter to begin'
    print_icon
    gets
    second_task
    clear_screen
    sleep(2)
    puts 'Great job on passing the second task! You\'ve shown yourself to be quite adept at these challenges.'
    puts 'The third task is your final challenge in the tournament. Are you ready?'
    puts 'Press Enter to begin'
    print_icon
    gets
    third_task
  end

  def print_icon
    print @player_icon
  end

  def clear_screen
    system 'cls'
    system 'clear'
  end

  def first_task
    puts 'You are standing in a massive enclosure. In front of you looms a'
    puts "dragon. It\'s massive. It rears its head to you and stares menacingly."
    sleep(3)
    puts 'You need to get the golden egg. Which is firmly under the dragon.'
    sleep(2)
    puts 'What will you do?'
    dragon_battle
  end

  def second_task
    puts 'You have reached the underwater city of merpeople.'
    sleep(2)
    puts 'You have taken gillyweed to survive underwater for the duration of this task.'
    puts 'which has given you gills for the time being.'
    sleep(4)
    puts 'In front of you are four hostages. Ron, Hermione, Cho, and Gabrielle'
    sleep(2)
    puts 'But, none of the other champions have arrived yet, but you\'re worried about everyone here'
    puts 'Who will you save first?'
    save_hostages
  end

  def third_task
    puts 'The third task was a maze. You didn\'t have too much trouble getting through,'
    puts 'but you and Cedric have ended up in a strange place...'
    sleep(2)
    puts 'Suddenly you hear a voice from the darkness'
    sleep(2)
    puts '???: Kill the spare'
    sleep(2)
    puts 'A flash of green light and suddenly Cedric drops dead in front of you.'
    sleep(2)
    puts 'You are tied to a statue. Wormtail draws your blood, deposits it, some bones, and his own hand into a cauldron.'
    sleep(3)
    puts 'Then he drops in what appears to be a child.'
    sleep(4)
    puts 'Then...'
    sleep(2)
    puts 'Lord Voldemort rises again from the cauldron.'
    sleep(2)
    puts 'He removes your restraints and hands you your wand.'
    sleep(2)
    puts 'Voldemort: Imperio!'
    sleep(2)
    puts 'A voice in your head is telling you to submit to Voldemort.'
    puts 'What do you do?'
    print_last_commands
  end

  def print_last_commands
    puts "Commands \t - \t Keyword"
    puts
    puts "Cast Expelliarmus \t\t - \t exp"
    puts "Run \t\t - \t run"
    puts "Clear screen \t\t - \t clear"
  end

  def print_hostages
    puts "Hostage \t - \t Keyword"
    puts
    @hostages.each { |key, value| puts "#{value} \t - \t #{key}" }
    puts "Clear Screen \t - \t clear"
  end

  def save_hostages
    loop do
      print_hostages
      print_icon
      hostage = gets.chomp
      if hostage.include?('ron')
        if @cho_saved && @herm_saved && @gab_saved
          puts 'You pull Gabrielle\'s body towards you as you swim to Ron.'
          sleep(2)
          puts 'There isn\'t much time left, you better hurry to the surface!'
          sleep(2)
          puts 'You\'re swimming as fast as you can, but you feel the water in your mouth.'
          sleep(2)
          puts 'Not much time left! Hurry!!'
          sleep(2)
          puts 'You feel your head breach the water! You\'ve made it!'
          sleep(2)
          puts 'You have passed the second task!'
          break
        else
          puts 'Maybe you should make sure the other hostages are fine first.'
        end
      elsif hostage.include?('herm')
        if @herm_saved
          puts 'Hermione has already been saved.'
        else
          puts 'You swim towards Hermione. You grab a sharp rock and start trying to'
          puts 'cut her ties loose.'
          sleep(3)
          puts 'Suddenly you turn around and see a massive shark barrelling towards you!'
          sleep(2)
          puts 'But wait, it\'s not a shark! It\'s Victor Krum!'
          sleep(2)
          puts 'He rips the rope with his teeth, grabs Hermione and heads to the surface!'
          sleep(2)
          puts 'Hermione has been saved'
          @herm_saved = true
          hostages.delete('herm')
        end
      elsif hostage.include?('cho')
        if @cho_saved
          puts 'Cho has already been saved!'
        else
          puts 'You swim towards Cho and start to try to use a sharp rock to'
          puts 'untie her restraints.'
          sleep(3)
          puts 'As you begin to cut her bonds, Cedric, with a protective air bubble'
          puts 'around his head, comes up to you.'
          sleep(3)
          puts 'He nods to you, takes out his wand, and severs the bonds with ease.'
          sleep(2)
          puts 'He floats to the top with Cho.'
          sleep(2)
          puts 'Cho has been saved!'
          @cho_saved = true
          hostages.delete('cho')
        end
      elsif hostage.include?('gab')
        if @herm_saved && @cho_saved
          puts 'You go towards Gabrielle and begin to undo her restraints with another rock.'
          sleep(3)
          puts 'Fleur has still not arrived, and the time is growing short...'
          sleep(3)
          puts 'I don\'t know if you should wait much longer'
          sleep(3)
          puts 'It\'s nearly the of the time, you have to make a decision.'
          sleep(2)
          puts 'You undo Gabrielle\'s restraints. If Fleur can\'t make it, someone has to help.'
          sleep(2)
          puts 'You have saved Gabrielle!'
          @gab_saved = true
          hostages.delete('gab')
        elsif !@herm_saved || !@cho_saved
          puts 'Maybe focus on another hostage for the time being.'
        else
          puts 'Gabrielle has already been saved!'
        end
      elsif hostage.include?('clear')
        clear_screen
      else
        'Not a valid command!'
      end
    end
  end

  def dragon_battle
    loop do
      print_icon
      cmd = gets.chomp
      if cmd.include?('man')
        print_commands
      elsif cmd.include?('spell')
        done = cast_spell
        break if done
      elsif cmd.include?('run')
        rng = Random.rand
        puts 'You attempt to run away from the dragon.'
        if rng < 0.85
          sleep(2)
          puts 'You trip and fall. You get back up and face the dragon.'
        else
          sleep(2)
          puts 'You try to run but the Horntail catches you and eats you.'
          puts 'Game Over'
          sleep(4)
          exit(0)
        end
      elsif cmd.include?('clear')
        clear_screen
      else
        puts 'Not a valid command!'
      end
    end
  end

  def print_commands
    puts "Commands \t - \t Keyword"
    puts
    puts "Spells \t\t - \t spell"
    puts "Run \t\t - \t run"
    puts "Clear screen \t - \t clear"
  end

  def cast_spell
    puts 'Select your spell'
    print_spells
    done = false
    loop do
      print_icon
      spell = gets.chomp
      if spell.include?('exp')
        puts 'You: Expelliarmus!'
        sleep(3)
        puts 'Your spell hits the dragon in the face and explodes in several sparks.'
        sleep(2)
        puts 'Unfortunately it looks as though it\'s only made the dragon angrier.'
        break
      elsif spell.include?('acc')
        puts 'Accio what?'
        print_accio
        done = decide_accio
        break
      else
        puts 'Not a valid spell!'
      end
    end
    done
  end

  def print_spells
    puts "Spells \t\t - \t Keyword"
    puts
    puts "Expelliarmus \t - \t exp"
    puts "Accio \t\t - \t acc"
  end

  def print_accio
    puts "Item \t\t - \t Keyword"
    puts
    puts "Firebolt \t - \t fbolt"
    puts "Ron \t\t - \t ron"
    puts "Horntail \t - \t horn"
  end

  def decide_accio
    print_icon
    cmd = gets.chomp
    loop do
      if cmd.include?('fbolt')
        puts 'You: Accio Firebolt!'
        sleep(2)
        puts 'You wait for a moment, and then zooming out of the sky comes your firebolt!'
        sleep(2)
        puts 'It comes to a stop near you and floats, eagerly awaiting its rider.'
        sleep(2)
        puts 'You jump on and dash towards the dragon'
        sleep(2)
        puts 'It reaches for you with its teeth but you swerve nicely out of the way.'
        sleep(2)
        puts 'You zoom underneath the dragon and triumphantly grab the egg.'
        sleep(2)
        puts 'Nice job! You have passed the first task.'
        return true
      elsif cmd.include?('ron')
        if @ron
          puts "I wouldn\'t do that, he\'s in the medical tent."
          break
        end
        puts 'Out of the crowd Ron comes zooming towards you face first.'
        sleep(2)
        puts 'He smacks into the ground and skids to a halt in a pile of mud.'
        sleep(2)
        puts 'A medic comes and grabs him and runs him into the medical tent.'
        sleep(2)
        puts('Oh well, just stick to the task')
        sleep(2)
        @ron = true
        break
      elsif cmd.include?('horn')
        puts 'The Horntail comes zooming towards you and crashes into you and the side of the enclosure.'
        puts 'Game Over'
        sleep(5)
        exit(0)
      else
        puts 'Not a valid command'
      end
    end
    false
  end
end
