class Madlib3
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = 
        ["noun", "adjective", "adjective", "noun", "noun", "verb", "noun", "adjective", "noun", "noun", "adjective", "noun"]
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
            # binding.pry
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
        puts "                              CAMPING"
        puts "
    This weekend my #{new_list[0].light_blue} is taking me camping.  We go every year
    to the same spot as it's very #{new_list[1].light_blue} and the views are
    #{new_list[2].light_blue} from the top of the #{new_list[3].light_blue}.  We build a #{new_list[4].light_blue} which is
    where we #{new_list[5].light_blue} all our food.  I love toasting a(n) #{new_list[6].light_blue} over the fire.
    It tastes very #{new_list[7].light_blue}. When you are camping you have to watch
    out for a(n) #{new_list[8].light_blue} and a(n) #{new_list[9].light_blue}.  They can be dangerous.  It is
    very #{new_list[10].light_blue} in the tent at night so it is best to remember
    to bring a #{new_list[11].light_blue}. "
        puts ""
        puts "---------------------------------------------------------------"
        puts ""
    end
end
