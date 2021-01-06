class Madlib1
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = ["adjective", "noun"]
        @new_list = []
        random_madlib
    end

    def random_madlib
        input = ""
        puts "Would you like to randomly generate the words for this Mad Lib? (y/n)"
        input = gets.strip.downcase
        if input == "y"
            @word_list.each do |n| 
                @new_list << API.new("random", n).random_word
            end
            complete_madlib
        elsif input == "n"
            create_list
        else
            puts "I'm sorry.  I didn't understand that."
            random_madlib
        end
    end

    def create_list
        input = ""
        @word_list.each_with_index do |word, index|
            puts "Enter a(n) #{word.green} or type 'random' for a random #{word.green}"
            input = gets.strip.downcase
                if input != "random"            
                    valid = API.new(input,word).valid_partofspeech?
                    while valid == false
                        puts "I am sorry.  Your word does not appear to be a(n) #{word.green}.  Please try again."
                        input = gets.strip.downcase
                        valid = API.new(input,word).valid_partofspeech?
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
        puts "A vacation is when you take a trip to some #{new_list[0].red} place with your #{new_list[1].red}."
        return_to_menu
    end

    def return_to_menu
        puts ""
        puts "---------------------------------------"
        puts "Type 'menu' to return to the main menu."  # Want to add this functionality "Otherwise type 'exit' to quit program."
        input = gets.strip.downcase
        if input == "menu" #this creates a new CLI instance.  Need to fix that.  requires typing exit twice to exit.
            CLI.new.call
        # elsif input == "exit"
        #     CLI.new.exit_program
        # How do I get the program to exit from here?
        else
            puts "I'm sorry.  I didn't understand that."
            return_to_menu
        end
    end
end
