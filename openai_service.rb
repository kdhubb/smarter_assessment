require 'csv'

class OpenAIService 
  def categorize_prompt(csv)
    product_info = CSV.parse(File.read(csv), headers: true)
    product_info.each do |product|
      product["product_name"] +
    end
    prompt = 
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
          "content": "#{product_info}"
    }
    ]
    p product_info[0]["product_name"]
  end

  def conn
    params = 
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

OpenAIService.new.categorize_prompt("/Users/kdhubbard/mod_5/hubbard_smarterxassessment/smarterx_data_sample.csv")