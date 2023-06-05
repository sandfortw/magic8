class Magic8Facade

  def generate_response(info)
    Magic8Service.new.generate_response(info.question)
  end
  
end