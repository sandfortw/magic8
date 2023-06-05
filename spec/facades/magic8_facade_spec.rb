# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Magic8Facade, type: :facade do
  describe '#generate_response' do
    it 'should generate a response when a string is provided' do
      response = Magic8Facade.new.generate_response('Will I become rich and famous?')
      p 'Good response:'
      p response
      expect(response).to be_a String
    end
  end
end
