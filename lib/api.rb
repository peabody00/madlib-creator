require 'uri'
require 'net/http'
require 'openssl'

# word = gets.chomp.downcase

# Can change endpoint by appending the URL with different types of GETS from API
# url = URI("https://wordsapiv1.p.rapidapi.com/words/" + word + "/definitions")

# Can search based off of several methods.  This one looks for verbs
# url = URI("https://wordsapiv1.p.rapidapi.com/words/?partofspeech=VERB&limit=100&page=1")

url = URI("https://wordsapiv1.p.rapidapi.com/words/?random=true?partofspeech=noun&limit=1&frequencymin=8.03")

# url = URI("https://wordsapiv1.p.rapidapi.com/words/?letterPattern=%5Ea.%7B4%7D%24&pronunciationpattern=.*%C3%A6m%24&limit=1&page=1&frequencymin=8.03")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = '47a914a770mshc0ef88da34b2c87p138bc9jsnd163c096c2f6'
request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'

response = http.request(request)
puts response.read_body