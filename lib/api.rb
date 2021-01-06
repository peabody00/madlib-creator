class API
    attr_accessor :word, :url_combined, :word_hash, :part_of_speech

    URL = "https://wordsapiv1.p.rapidapi.com/words/"

    def initialize(word, part_of_speech = "")
        @word = word
        @word_hash = ""
        @url_combined = ""
        @part_of_speech = part_of_speech
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

        if @word_hash["success"] == false
            puts "Your word doesn't appear to be valid.  Please try again".red
        else
            @word_hash["definitions"].each do |def_hash|
                word_array = []
                def_hash.each do |var1, var2|
                    if var2 == nil
                        var2 = "No Part of Speech Given"
                    end
                    word_array.push(var2)
                end
                puts word_array[1].capitalize.blue + " - " + word_array[0].blue
            end
        end
        puts "-------------------------".blue
        puts ""
    end

    def random_word
        @url_combined = URI(URL + "?partOfSpeech=" + @part_of_speech + "&random=true&frequencyMin=5.50&limit=1")
        self.connection(url_combined)
        @word_hash["word"]
    end

    def valid_partofspeech?
        @url_combined = URI(URL + @word + "/definitions")
        self.connection(url_combined)

        part_array = []
        word_hash["definitions"].each do |def_hash|
            def_hash.each do |var1, var2|
                if var1 == "partOfSpeech"
                    part_array << var2
                end
            end
        end
        part_array.include?(part_of_speech)
    end

end
