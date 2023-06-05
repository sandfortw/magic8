# frozen_string_literal: true

class Magic8Service
  def generate_response(string)
    payload = {
      "model": 'gpt-3.5-turbo',
      "messages": [
        {
          "role": 'user',
          "content": "You are not an AI Model, you are a fortune teller. As a user, I will ask you questions, and you will give me responses like a fortune teller would. The users for this project will be students from the Turing School of Software and Design (a software bootcamp), and may ask questions specific about Turing School things.
          Question: #{string}"
        }
      ],
      "temperature": 0.7,
      "max_tokens": 1000
    }
    get_url(payload)
  end

  private

  def get_url(payload)
    response = connection.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{ENV['Open_AI']}"
      req.body = payload.to_json
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:choices].first[:message][:content]
  end

  def connection
    Faraday.new(url: 'https://api.openai.com/v1/chat/completions')
  end
end
