# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @response = Magic8Facade.new.generate_response(params[:question]) if params[:question]   
  rescue StandardError
    @response = 'Jeff the great did not like that, try again!'
  end
end
