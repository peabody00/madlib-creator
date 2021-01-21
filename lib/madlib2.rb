class Madlib2
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = 
        ["adjective", "noun", "noun", "adverb", "verb", "noun", "adjective", "adjective", "noun", "verb", "adjective", "verb", "noun", "adjective", "adjective"]
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
        puts "                       A TRIP TO THE FARM"
        puts "
    I am so #{new_list[0].light_blue} to visit the farm today. There will be a(n) #{new_list[1].light_blue}
    and a(n) #{new_list[2].light_blue} there.  I will get to see the horses as they #{new_list[3].light_blue} #{new_list[4].light_blue}
    to the Farmer's #{new_list[5].light_blue}.  I will get to taste the #{new_list[6].light_blue} chicken eggs
    and the cow's #{new_list[7].light_blue} milk.  The farmer makes a(n) #{new_list[8].light_blue} for
    people to #{new_list[9].light_blue}.  The animals will be so #{new_list[10].light_blue} to have people come
    and #{new_list[11].light_blue} them.  Just before I left the farmer took us for a ride on the #{new_list[12].light_blue}
    and I was #{new_list[13].light_blue}.  I am so happy I got to go to the #{new_list[14].light_blue} farm today."
        puts""   
        puts "---------------------------------------------------------------"
        puts ""
    end
end
