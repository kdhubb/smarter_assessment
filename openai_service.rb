require 'csv'
require './product_facade.rb'
require './product.rb'

class OpenAIService 
  def categorize_prompt(product_data)
    [
      {
        "role": "system",
        "content": "You are a helpful assistant."
      },
      {
        "role": "user",
        "content": "Can you create categories for the following products based on their name and marketing copy?"
      },
      {
          "role": "assistant",
          "content": "Certainly! I'd be happy to help you create categories for the products based on their names and marketing copy. Please provide me with the names and marketing copy for the products, and I'll assist you in creating relevant categories."
      },
      {
          "role": "user",
          "content": "#{product_data}"
    }
    ]
  end

  def conn
    params = categorize_prompt(ProductFacade.new.stringify_product_info)
    Faraday.post(url: 'https://api.openai.com/v1/chat/completions') do |faraday|
      faraday.header['Authorization'] = ENV['OPENAI_KEY']
      faraday.body = JSON.generate(params)
    end
  end

  # def get_url
  #   response = conn.get
  #   JSON.parse(response.body)
  # end

  # def get_categories(csv)
  #   get_url
  # end

end

# OpenAIService.new.categorize_prompt("/Users/kdhubbard/mod_5/hubbard_smarterxassessment/smarterx_data_sample.csv")