class Madlib1
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = 
        ["adjective", "adjective", "noun", "noun", "noun", "adjective", "noun", "verb", "verb", "adjective", "noun", "adjective", "noun", "noun", "adjective", "noun"]
        @new_list = []
        random_madlib
    end

    def random_madlib
        input = ""
        puts "Would you like to randomly generate the words for this Mad Lib (this can take some time)? (y/n)"
        input = gets.strip.downcase
        if input == "y"
            @word_list.each do |n| 
                @new_list << API.new("random", n).random_word
            end
            complete_madlib
        elsif input == "n"
            create_list
        else
            puts "I'm sorry.  I didn't understand that.".red
            puts ""
            random_madlib
        end
    end

    def create_list
        input = ""
        @word_list.each do |word|
            puts "Enter a(n) #{word.green} or type 'random' for a random #{word.green}"
            input = gets.strip.downcase
            if input.empty?
                input = " "
            end
                if input != "random"          
                    valid = API.new(input,word).valid_partofspeech?
                    while valid == false
                        puts "I am sorry.  Your word does not appear to be a(n) #{word.green}.  Please try again."
                        input = gets.strip.downcase
                        valid = API.new(input,word).valid_partofspeech?
                        # if you misspell random it validates but then forces you to do a real word.  Can't do random anymore.
                    end
                    @new_list << input
                else
                    @new_list << API.new("random", word).random_word
                end
        end
        complete_madlib
    end

    def complete_madlib
        puts""
        puts "                       VACATIONS"
        puts "
    A vacation is when you take a trip to some #{new_list[0].light_blue} place
    with your #{new_list[1].light_blue} family. Usually you go to some place that
    is near a(n) #{new_list[2].light_blue} or up on a(n) #{new_list[3].light_blue}.
    A good vacation place is one where you can ride in a(n) #{new_list[4].light_blue}
    or play a(n) #{new_list[5].light_blue} game or go hunting for a(n) #{new_list[6].light_blue}.
    I like to #{new_list[7].light_blue} or #{new_list[8].light_blue} while on vacation.
    Last summer, my little brother fell in a(n) #{new_list[9].light_blue} #{new_list[10].light_blue}
    and got a(n) #{new_list[11].light_blue} #{new_list[12].light_blue} all over his #{new_list[13].light_blue}.  Parents need
    vacations more than kids because parents are always very
    #{new_list[14].light_blue} and because they have to work many hours,
    every day, all year, earning #{new_list[15].light_blue} to pay for the vacation."
        puts""
        puts "---------------------------------------------------------------"
        puts ""
    end
end
