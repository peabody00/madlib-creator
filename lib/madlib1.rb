class Madlib1
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = ["adjective", "noun"]
        @new_list = []
        create_list
    end
    
    def create_list
        input = ""
        @word_list.each_with_index do |word, index|
            puts "Enter a(n) #{word} or type 'random' for a random #{word}"
            input = gets.strip.downcase
                if input != "random"
                    @new_list << input
                else
                    #This will connect to the API class to search for a random word that matches the word type and then shovels it into @new_list
                    @new_list << "random"
                end
        end
        complete_madlib
    end

    def complete_madlib
        puts "A vacation is when you take a trip to some #{new_list[0]} place with your #{new_list[1]}."
    end
end
