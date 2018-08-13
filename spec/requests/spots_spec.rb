# spec/requests/spots_spec.rb
require 'rails_helper'

RSpec.describe 'VanSpots API', type: :request do
  # add spots owner
  let(:user) { create(:user) }
  let!(:spots) { create_list(:spot, 10, created_by: user.id) }
  let(:spot_id) { spots.first.id }
  # authorize request
  let(:headers) { valid_headers }
  let(:bad_headers) { no_auth_headers }

  # Test suite for GET /api/spots when not authorized
  describe 'GET /api/spots' do
    before { get '/api/spots' , params: {}, headers: bad_headers}

    it 'returns spots' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  # Test suite for GET /api/spots when authorized
  describe 'GET /api/spots' do
    before { get '/api/spots', params: {}, headers: headers }

    it 'returns spots' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /:userID/spots
  # describe 'GET /:userID/spots' do
  #   # make HTTP get request before each example
  #   before { get ':userID/spots', params: {}, headers: headers }
  #
  #   it 'returns spots' do
  #     # Note `json` is a custom helper to parse JSON responses
  #     expect(json).not_to be_empty
  #     expect(json.size).to eq(10)
  #   end
  #
  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # Test suite for GET /api/spots/:id
  describe 'GET /api/spots/:id' do
    before { get "/api/spots/#{spot_id}", params: {}, headers: headers }

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
      let(:spot_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Spot/)
      end
    end
  end

  # Test suite for POST /api/spots
  describe 'POST /api/spots' do
    # valid payload
    let(:valid_attributes) { { name: 'Narnia',
                               created_by: user.id.to_s,
                               description: 'peaceful once you defeat the ice queen',
                               latitude: 51.558823,
                               longitude: -4.160025 }.to_json }

    context 'when the request is valid' do
      before { post '/api/spots', params: valid_attributes, headers: headers }

      it 'creates a spot' do
        expect(json['name']).to eq('Narnia')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { name: nil }.to_json }
      before { post '/api/spots', params: invalid_attributes, headers: headers }


      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Name can't be blank, Description can't be blank, Latitude can't be blank, Longitude can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/spots/:id
  describe 'PUT /api/spots/:id' do
    let(:valid_attributes) { { name: 'Not Narnia' }.to_json }
    before { put "/api/spots/#{spot_id}", params: valid_attributes, headers: headers }

    context 'when the spot exists' do

      it 'updates the spot' do
        expect(json['name']).to eq('Not Narnia')
        updated_spot = Spot.find(spot_id)
        expect(updated_spot.name).to match(/Not Narnia/)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the spot does not exist' do
      let(:spot_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Spot/)
      end
    end
  end

  # Test suite for DELETE /api/spots/:id
  describe 'DELETE /api/spots/:id' do
    before { delete "/api/spots/#{spot_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end