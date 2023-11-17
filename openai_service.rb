require 'faraday'

class OpenAIService 

  def conn
    Faraday.new(url: 'https://api.openai.com/v1/chat/completions') do |faraday|
      faraday.header['Authorization'] = ENV['SPOON-KEY']
      faraday.params['number'] = 10
    end
  end
end