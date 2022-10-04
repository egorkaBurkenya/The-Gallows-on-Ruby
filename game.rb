def draw_table game, gallows_frames
    print gallows_frames[game[:player_health]]
    print("\n\nИгрок: #{game[:player_name]} ---")
    print("\nЗдоровье: #{'💖' * game[:player_health]}")
    print("\n\nСлово: #{game[:player_word]}")
end

def win game
    puts "СЛОВО ДЕЙСТВИТЕЛЬНО #{game[:word]}!!!"
    puts "#{game[:player_name]} ПОБЕДИЛ!!!!!"
end

def loss game, gallows_frames
    puts gallows_frames[0]
    puts "ты не угадал слово #{game[:word]}"
    puts "#{game[:player_name]} Проиграл..."
end

def open_letter game, letter
    new_word = game[:player_word].split("")
    index = 0
    game[:word].split("").each { |c|
        if letter == c
            new_word[index] = letter
            index += 1
        else
            index += 1
        end
    }
    game[:player_word] = new_word.join("")
end

def give_me_letter_or_word game
    print "\nВведите букву или слово:"
    msg = gets.chomp
    if msg.length == game[:word].length
        if msg == game[:word]
            game[:player_word] == msg
        else
            game[:player_health] -= 2
            puts "⛔Не угадал"
        end
    elsif game[:word].include? msg
        puts "✅Такая буква действительно есть! Откройте букву #{msg}"
        open_letter game, msg
    else 
        puts "⛔Такой буквы нет!!! "
        game[:player_health] -= 1
    end
end

def check_game_status game, isGame, gallows_frames
    if game[:player_health] == 0
        loss game, gallows_frames
        return false
    elsif game[:word] == game[:player_word]
        win game
        return false
    end
    return true
end

def replay game_def, words, game, gallows_frames
    print "\n\nХотите поиграть еще раз? Y/N: "
    answer = gets.chomp
    if answer.empty?
        replay(game_def, words, game, gallows_frames)
    elsif answer == "Y"
        game_def.call(words, game, gallows_frames)
    elsif answer == "N"
        puts "Пока пока!"
    else
        replay(game_def, words, game, gallows_frames)
    end
end

def game_process words, game, gallows_frames
    print "Введите свое имя: "
    game[:player_name] = gets.chomp
    game[:player_health] = 5
    game[:word] = words.sample
    game[:player_word] = "#{'■' * game[:word].length}"
    isGame = true
    while isGame
        draw_table game, gallows_frames
        give_me_letter_or_word game
        isGame = check_game_status game, isGame, gallows_frames
    end
    foo = proc { |words, game, gallows_frames| game_process(words, game, gallows_frames)}
    replay(foo, words, game, gallows_frames)
end


gallows_frames = Hash.new
gallows_frames[0] = "  
--------
|/     |
|     (_)
|     _|_
|    / | \\
|      |
|     / \\
|    /   \\
|
__|________
|         |
"
gallows_frames[1] = "  
--------
|/     |
|     (_)
|     
|    
|      
|     
|    
|
__|________
|         |
"
gallows_frames[2] = "  
--------
|/     
|     
|     
|    
|      
|     
|    
|
__|________
|         |
"
gallows_frames[3] = "      
|     
|     
|    
|      
|     
|    
|
__|________
|         |
"
gallows_frames[4] = "      
__|________
|         |
"
words = ["ruby", "python", "javaScript", "Borisov"]
game = {}

# foo.call(words, game, gallows_frames)

game_process(words, game, gallows_frames)