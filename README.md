# Madlib Creator & Dictionary

Welcome to the Mad Lib Creator & Dictionary.  This CLI program is meant to be a fun way to explore words and definitions.  

## Installation

This program requires API access to [WordsAPI](https://rapidapi.com/dpventures/api/WordsAPI) from [RapidAPI](https://rapidapi.com/marketplace).

Sign up for a RapidAPI account and then subscirbe to WordsAPI.  Once you have subscribed you should have access to an API key for your account.  Download or clone my github repository.  In my program the `environment.rb` requires a file called `secrets.rb`.  Create this file in your main program folder.  In that file make a constant that equals your API key. `API_KEY = '<APIkey>'`.  Now when the program needs to make a connection to the API it has the key that is required.  If you push code back to github be sure to exclude the `secretes.rb` file.

You should now be able to simply run `./bin/madlib` from the project directory.

## Usage

The user is presented with 4 options in the main menu.  There are three different Mad Libs they can explore or they can look up different words.  The user has the option while in the different Mad Libs to completely or partially fill out the Mad Lib with random words that fit the part of speech being requested.  One of the intended uses of this program is to take random words that a user isn't familiar with and to look them up using the program's definition feature.  Once the user is done they can type exit to end the program.

## License

This program is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
