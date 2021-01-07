class CLI

    def call
        puts ""
        puts "Welcome to the Mad Lib Creator"
        puts ""
        main_menu
        user_input
        exit_program
    end

    def main_menu
        puts "Please enter the number for one of the following options:"
        puts "1. Mad Lib 1"
        puts "2. Mad Lib 2"
        puts "3. Mad lib 3"
        puts "4. Define word"
        # puts "Type 'menu' to see options again"
        puts "Type 'exit' when you are done"
        puts ""
    end

    def user_input
        input = ""
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "1"
                Madlib1.new
                main_menu
            when "2"
                puts "Here is Mad Lib 2"
                main_menu
            when "3"
                puts "Here is Mad Lib 3"
                main_menu
            when "4"
                puts "Enter word to define"
                word = gets.strip.downcase
                API.new(word).definition
                main_menu
            else
                puts " I am sorry.  I didn't understand that.".red
                puts ""
                main_menu
            # when "menu"
            #     main_menu
            end
        end  
    end

    def exit_program
        puts "--------------------------------------------------------"
        puts "Thanks for trying the Mad Lib Creator"
        puts "Mad Libs created by Leonard Stern and Roger Price, 1953."
        puts "--------------------------------------------------------"
    end
end