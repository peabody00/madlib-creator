class CLI

    def call
        puts ""
        puts "Welcome to the Mad Lib Creator & Dictionary"
        puts ""
        puts "Choose one of the Mad Libs to fill out or use the dictionary feature to look".light_green
        puts "up any new words you learn from the random word feature in each Mad Lib.".light_green
        puts ""

        main_menu
        user_input
        # exit_program
    end

    def main_menu
        puts "Please enter the number for one of the following options:"
        puts "1. Mad Lib - Vacations"
        puts "2. Mad Lib 2"
        puts "3. Mad lib 3"
        puts "4. Define word"
        puts "Type 'exit' when you are done."
    end

    def user_input
        input = ""
        # while input != "exit"
        loop do
            input = gets.strip.downcase
            case input
            when "1"
                Madlib1.new
                main_menu
            when "2"
                Madlib2.new
                main_menu
            when "3"
                Madlib3.new
                main_menu
            when "4"
                puts "Enter word to define"
                word = gets.strip.downcase
                API.new(word).definition
                main_menu
            when "exit"
                exit_program
                break
            else
                puts ""
                puts " I am sorry.  I didn't understand that.".red
                puts ""
            #     # main_menu
            end
        end  
    end

    def exit_program
        puts "--------------------------------------------------------"
        puts "Thanks for trying the Mad Lib Creator & Dictionary"
        puts "Dictionary functionality from WordsAPI"
        puts "Mad Libs created by Leonard Stern and Roger Price, 1953."
        puts "--------------------------------------------------------"
    end
end