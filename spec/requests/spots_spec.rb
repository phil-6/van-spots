# spec/requests/spots_spec.rb
require 'rails_helper'

RSpec.describe 'VanSpots API', type: :request do
  # initialize test data 
  let!(:spots) { create_list(:spot, 10) }
  let(:spot_id) { spots.first.id }

  # Test suite for GET /spots
  describe 'GET /spots' do
    # make HTTP get request before each example
    before { get '/spots' }

    it 'returns spots' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /spots/:id
  describe 'GET /spots/:id' do
    before { get "/spots/#{spot_id}" }

    context 'when the record exists' do
      it 'returns the spot' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(spot_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:spot_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Spot/)
      end
    end
  end

  # Test suite for POST /spots
  describe 'POST /spots' do
    # valid payload
    let(:valid_attributes) { { name: 'Narnia',
                               created_by: '1',
                               description: 'peaceful once you defeat the ice queen',
                               latitude: 51.558823,
                               longitude: -4.160025 }.to_json  }

    context 'when the request is valid' do
      before { post '/spots', params: valid_attributes }

      it 'creates a spot' do
        expect(json['name']).to eq('Narnia')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/spots', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /spots/:id
  describe 'PUT /spots/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/spots/#{spot_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /spots/:id
  describe 'DELETE /spots/:id' do
    before { delete "/spots/#{spot_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end