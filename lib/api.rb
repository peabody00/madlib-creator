# require 'uri'
# require 'net/http'
# require 'openssl'
# require "awesome_print"
# require 'json'

class API
    attr_accessor :word, :url_combined, :word_hash
    # attr_reader :url, :http

    URL = "https://wordsapiv1.p.rapidapi.com/words/"

    def initialize(word)
        @word = word
        # @url = "https://wordsapiv1.p.rapidapi.com/words/"
        @word_hash = ""
        @url_combined = ""
    end

    def connection(url_combined)
        http = Net::HTTP.new(url_combined.host, url_combined.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url_combined)
        request["x-rapidapi-key"] = '47a914a770mshc0ef88da34b2c87p138bc9jsnd163c096c2f6'
        request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'

        response = http.request(request)
        body = response.read_body
        @word_hash = JSON.parse(body)
    end

    def definition
        @url_combined = URI(URL + @word + "/definitions")
        self.connection(url_combined)
        # puts @word_hash

        @word_hash["definitions"].each do |def_hash|
            word_array = []
            def_hash.each do |var1, var2|
                word_array.push(var2)
            end
            puts word_array[1].capitalize.blue + " - " + word_array[0].blue
        end
        puts "-------------------------".blue
        puts ""
    end

    def random_word
        @url_combined = URI(URL + "?random=true")
        self.connection(url_combined)
        @word_hash["word"]
    end

end

# word = API.new("shoe").random_word
# puts word
# puts "Please enter word to search "
# word = gets.chomp.downcase

# # Can change endpoint by appending the URL with different types of GETS from API
# url = URI("https://wordsapiv1.p.rapidapi.com/words/" + word + "/definitions")

# # Can search based off of several methods.  This one looks for verbs
# # url = URI("https://wordsapiv1.p.rapidapi.com/words/?partofspeech=VERB&limit=100&page=1")

# # url = URI("https://wordsapiv1.p.rapidapi.com/words/?random=true?partofspeech=noun&limit=1&frequencymin=8.03")

# # url = URI("https://wordsapiv1.p.rapidapi.com/words/?letterPattern=%5Ea.%7B4%7D%24&pronunciationpattern=.*%C3%A6m%24&limit=1&page=1&frequencymin=8.03")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = '47a914a770mshc0ef88da34b2c87p138bc9jsnd163c096c2f6'
# request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'

# response = http.request(request)
# # puts response.read_body
# body = response.read_body
# word_hash = JSON.parse(body)

# word_hash["definitions"].each do |def_hash|
#     word_array = []
#     def_hash.each do |var1, var2|
#         word_array.push(var2)
#     end
#     puts word_array[1].capitalize + " - " + word_array[0]
# end
