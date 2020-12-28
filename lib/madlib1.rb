class Madlib1
    attr_reader :word_list, :new_list
    
    def initialize
        @word_list = ["adjective", "noun"]
        @new_list = []
        create_list
    end
    
    def create_list
        
        @word_list.each_with_index do |word, index|
            puts "Enter a(n) #{word}"
            @new_list << gets.strip.downcase

        end
        complete_madlib
    end

    def complete_madlib
        puts "A vacation is when you take a trip to some #{new_list[0]} place with your #{new_list[1]}."
    end
end
