class LevelOne
  attr_accessor :player_icon

  def initialize(player_icon, _topics = [])
    @player_icon = player_icon
    @topics = ["Who are you? \t\t\t - \t\t who", "Why are you here? \t\t - \t\t why", "How did you know my parents? \t - \t\t how"]
  end

  def scenario
    clear_screen
    puts "\t\t\t\t Philospher\'s Stone"
    puts 'You are in a shack in the middle of the sea. There only 10 seconds left before you turn 11.'
    puts 'Forced into leaving Privet Drive because for once in your life you got a letter.'
    puts 'Oh well, at least you will be a year older soon, and another year closer to leaving this house.'
    print_icon
    prompt_and_handle_command
    puts 'A loud knock on the door jolts everyone in the shack.'
    sleep(2)
    puts 'BOOM'
    puts 'Another knock! Louder than the first, the door is struggling to stay on its hinges'
    sleep(4)
    puts 'SMASH'
    puts 'The door crashes to the floor. Uncle Vernon is nervously pointing his rifle at a massive figure.'
    puts 'A giant man walks in. He sheepishly puts the door back on its hinges.'
    puts 'He takes the gun from Uncle Vernon, ties it in a bow, and tosses it to the side.'
    sleep(8)
    puts 'He hands you a package and you open it'
    sleep(2)
    puts 'Whew! It contains a cake! Pink icing with green letters that reads Happy Birthday Harry'
    sleep(2)
    puts "???: Happy Birthday to yeh, \'Arry"
    sleep(2)
    puts 'You remain silent.'
    sleep(3)
    puts "???: Last\' time I saw yeh, you was only a baby. Yeh look a lot like yer dad,"
    puts "but yeh\'ve got yer mom\'s eyes"
    sleep(4)
    puts 'You still remain silent'
    sleep(3)
    puts 'The figure is staring at you. Your mind is racing with questions.'
    puts "You really want to know what is happening, but you\'re unsure about what to ask"
    sleep(3)
    print_conversation_topics
    print_icon
    prompt_and_handle_conversation
  end

  def countdown_to_birthday
    i = 10
    until i.zero?
      time_string = "#{i} seconds" if i != 1
      time_string = "#{i} second" if i == 1
      puts time_string
      sleep(1)
      i -= 1
    end
    puts 'BOOM'
  end

  def clear_screen
    system 'cls'
    system 'clear'
  end

  def print_icon
    print @player_icon
  end

  def print_commands
    puts "Commands \t\t\t - \t Keyword"
    puts
    puts "Countdown to your birthday \t - \t count"
    puts "Take Letter \t\t\t - \t take"
    puts "Do nothing \t\t\t - \t noth"
    puts "Clear screen \t\t\t - \t clear"
  end

  def print_conversation_topics
    puts "Things you can ask \t\t\t - \t Keyword"
    puts
    @topics.each do |topic|
      puts topic
    end
  end

  def prompt_and_handle_conversation
    handle_conversation(gets.chomp, 0, '???')
  end

  def handle_conversation(cmd, selected_options, hagrid_name)
    until selected_options == 3
      if cmd.include?('how')
        how_text(hagrid_name)
        @topics.delete_at(2)
        selected_options += 1
      elsif cmd.include?('who')
        who_text(hagrid_name)
        hagrid_name = 'Hagrid'
        @topics.delete_at(0)
        selected_options += 1
      elsif cmd.include?('why')
        why_text(hagrid_name)
        @topics.delete_at(1)
        selected_options += 1
      else
        puts "#{hagrid_name}: Err wha\' sorry? I don\'t know wha\' yeh mean by #{cmd}"
      end
      cmd = prompt unless selected_options == 3
    end
  end

  def prompt
    print_conversation_topics
    print_icon
    gets.chomp
  end

  def who_text(hagrid_name)
    puts "You: I\'m sorry but, who exactly are you?"
    sleep(3)
    puts "#{hagrid_name}: Rubeus Hagrid, Keeper of keys and game at Hogwarts."
    sleep(8)
  end

  def why_text(hagrid_name)
    puts 'You: Why are you here?'
    puts "#{hagrid_name}: To bring yeh to Hogwarts o\' course! Do yeh not know about Hogwarts?"
    sleep(2)
    puts 'You remain silent'
    sleep(4)
    puts "#{hagrid_name}: \'Arry, yer a wizard! Yer parents were wizards!"
    sleep(3)
    puts "You: I\'m...a what?"
    sleep(4)
    puts "#{hagrid_name}: A wizard! And a damn good one I\'d reckon"
    sleep(7)
  end

  def how_text(hagrid_name)
    puts 'You: My parents? How did you know my parents?'
    sleep(3)
    puts "#{hagrid_name}: Knew \'em before you were born. Good man yer dad was."
    puts "An\' yeh\'d be hard pressed to find a smarter woman than yer mum."
    sleep(8)
  end

  def prompt_and_handle_command
    handle_command(gets.chomp, false)
  end

  def handle_command(cmd, counted)
    until counted
      if cmd.include?('man')
        print_commands
      elsif cmd.include?('count')
        countdown_to_birthday
        counted = true
      elsif cmd.include?('take')
        puts 'There is nothing to take!'
      elsif cmd.include?('noth')
        puts 'You lay on the dirty floor and do nothing'
      elsif cmd.include?('clear')
        clear_screen
      else
        puts 'That is not a command you can use'
      end
      print_icon unless counted
      cmd = gets.chomp unless counted
    end
  end
end
