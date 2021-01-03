class Madlib1
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = ["adjective", "noun"]
        @new_list = []
        # create_list
        random_madlib
    end

    def random_madlib
        input = ""
        puts "Would you like to randomly generate the words for this Mad Lib? (y/n)"
        input = gets.strip.downcase
        if input == "y"
            puts "random word list generated"
        elsif input == "n"
            create_list
        else
            puts "I'm sorry.  I didn't understand that."
            random_madlib
        end
    end

    def random_madlib_generator
        
    end

    
    def create_list
        input = ""
        @word_list.each_with_index do |word, index|
            puts "Enter a(n) #{word.green} or type 'random' for a random #{word.green}"
            input = gets.strip.downcase
                if input != "random"
                    @new_list << input
                else
                    #This will connect to the API class to search for a random word that matches the word type and then shovels it into @new_list
                    # @new_list << "random"
                    @new_list << API.new("random").random_word
                end
        end
        complete_madlib
    end

    def complete_madlib
        puts""
        puts "A vacation is when you take a trip to some #{new_list[0].red} place with your #{new_list[1].red}."
    end
end
