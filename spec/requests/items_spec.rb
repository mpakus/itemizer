require 'rails_helper'

describe 'Items', type: :request do
  context '/' do
    it 'has right answer' do
      get '/'
      expect(response.status).to eq 200
    end
  end
end
