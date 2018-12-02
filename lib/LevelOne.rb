class LevelOne
  attr_accessor :player_icon

  def initialize(player_icon, _topics = [], counted = false)
    @player_icon = player_icon
    @topics = { 'who' => "Who are you? \t\t\t - \t\t who", 'why' => "Why are you here? \t\t - \t\t why", 'how' => "How did you know my parents? \t - \t\t how" }
    @counted = counted
  end

  def scenario
    clear_screen
    puts "\t\t\t\t Philospher\'s Stone - \tCall to Adventure"
    puts 'You are in a shack in the middle of the sea. There only 5 seconds left before you turn 11.'
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
    puts "You: I can\'t believe I'm a wizard"
    puts "Hagrid: With a mum an\' dad likes yers, what else would yeh be?"
    puts "An\' I reckon it\'s abou\' time yeh read yer letter"
    puts 'Hagrid is offering you a letter. What do you do?'
    print_icon
    prompt_and_handle_command
  end

  def countdown_to_birthday
    i = 5
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
    @topics.each_value { |value| puts value.to_s }
  end

  def print_letter
    puts 'Dear Mr. Potter'
    puts "\t\tWe are pleased to inform you that you have been accepted"
    puts "\tto Hogwarts School of Witchcraft and Wizardry. Please"
    puts "\tfind enclosed a list of all necessary books and equipment."
    puts "\t\tTerm begins September 1. We await your owl by no"
    puts "\tlater than July 31."
    puts 'Yours Sincerely,'
    puts 'Minerva McGonagall,'
    puts 'Deputy Headmistress'
  end

  def prompt_and_handle_conversation
    handle_conversation(gets.chomp, 0, '???')
  end

  def handle_conversation(cmd, selected_options, hagrid_name)
    until selected_options == 3
      if cmd.include?('how')
        how_text(hagrid_name)
        @topics.delete('how')
        selected_options += 1
      elsif cmd.include?('who')
        who_text(hagrid_name)
        hagrid_name = 'Hagrid'
        @topics.delete('who')
        selected_options += 1
      elsif cmd.include?('why')
        why_text(hagrid_name)
        @topics.delete('why')
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
    handle_command(gets.chomp)
  end

  def handle_command(cmd)
    loop do
      if cmd.include?('man')
        print_commands
      elsif cmd.include?('count')
        unless @counted
          countdown_to_birthday
          @counted = true
          break
        end
        puts 'Nothing to count to until next year' if @counted
      elsif cmd.include?('take')
        puts 'There is nothing to take!' unless @counted
        if @counted
          good_ending
          break
        end
      elsif cmd.include?('noth')
        puts 'You lay on the dirty floor and do nothing' unless @counted
        if @counted
          bad_ending
        end
      elsif cmd.include?('clear')
        clear_screen
      else
        puts 'That is not a command you can use'
      end
      print_icon
      cmd = gets.chomp
    end
  end

  def good_ending
    sleep(2)
    puts "You take the letter and open it, and can\'t believe your eyes."
    print_letter
    sleep(15)
    puts 'You say nothing in stunned silence.'
    sleep(3)
    puts "Hagrid: Glad yeh know now. Tomorruh we\'ll get your books and supplies and get you ready to go."
    sleep(2)
    puts "The excitement is real. Soon you\'ll leave the Dursleys, soon you\'ll go to a place you\'re accepted."
    puts 'You have completed level one! Press enter to start level 2.'
  end

  def bad_ending
    sleep(3)
    puts 'You do nothing. Hagrid is still offering the letter.'
    sleep(3)
    puts "Hagrid: C\'mon \'Arry, this ain\'t a life for a youn\' wizard like yeh."
    sleep(5)
    puts "You: I know but, I can\'t leave the Dursleys, because this is all a dream."
    sleep(4)
    puts "Hagrid: This ain\'t a dream \'Arry! I'm really offering yeh an escape."
    sleep(3)
    puts "You: This is all a dream, I know it is. I\'ll wake up tomorrow under the stairs..."
    sleep(3)
    puts "Hagrid: \'Arry please take this."
    sleep(3)
    puts 'You: No. Please leave so I can wake up.'
    sleep(5)
    puts 'Hagrid leaves the hut, looking dejected.'
    sleep(6)
    puts 'You wake up the next morning still in the shack. Aunt Petunia and Uncle Vernon look gaunt and sleepy.'
    sleep(4)
    puts "After a few months pass you go t St. Brutus\'s Home for Incurably Criminal Boys."
    sleep(3)
    puts 'On your first day, a kid your age but with a beard the size of Hagrids decides to make you his target.'
    sleep(3)
    puts 'You have lost the game. Goodbye!'
    exit(0)
  end
end
