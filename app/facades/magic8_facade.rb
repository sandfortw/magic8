# frozen_string_literal: true

class Magic8Facade
  def generate_response(info)
    Magic8Service.new.generate_response(info.question)
  rescue StandardError
    'Jeff the great did not like that, try again!'
  end
end
