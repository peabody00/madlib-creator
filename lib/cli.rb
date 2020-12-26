class CLI

    def call
        puts "Welcome to the MadLib Creator"
        main_menu
        user_input
        exit_program
    end

    def main_menu
        puts "Please enter the number for one of the following options:"
        puts "1. MadLib 1"
        puts "2. MadLib 2"
        puts "3. Madlib 3"
        puts "4. Define word"
        puts "Type 'menu' to see options again"
        puts "Type 'exit' when you are done"
    end

    def user_input
        input = ""
        while input != "exit"
            input = gets.strip.downcase
            case input
            when "1"
                puts "Here is MadLib 1"
            when "2"
                puts "Here is MadLib 2"
            when "3"
                puts "Here is MadLib 3"
            when "4"
                puts "Enter word to define"
            when "menu"
                main_menu
            end
        end  
    end

    def exit_program
        puts "Thanks for trying the MadLib Creator"
    end
end