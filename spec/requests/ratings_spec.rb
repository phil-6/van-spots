# spec/requests/ratings_spec.rb
require 'rails_helper'

RSpec.describe 'Ratings API' do
  # Initialize the test data
  let(:user) { create(:user) }
  let!(:spot) { create(:spot, created_by: user.id) }
  let!(:ratings) { create_list(:rating, 20, spot_id: spot.id) }
  let(:spot_id) { spot.id }
  let(:id) { ratings.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /api/ratings
  describe 'GET /api/ratings' do
    before { get '/api/ratings', params: {}, headers: headers}

    context 'when rating exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all ratings' do
        expect(json.size).to eq(20)
      end
    end
  end

  # Test suite for GET /api/spots/:spot_id/ratings
  describe 'GET /api/spots/:spot_id/ratings' do
    before { get "/api/spots/#{spot_id}/ratings", params: {}, headers: headers }

    context 'when spot rating exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all spot ratings' do
        expect(json.size).to eq(20)
      end
    end

    context 'when spot does not exist' do
      let(:spot_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Spot/)
      end
    end
  end

  # Test suite for GET /api/spots/:spot_id/ratings/:id
  describe 'GET /api/spots/:spot_id/ratings/:id' do
    before { get "/api/spots/#{spot_id}/ratings/#{id}", params: {}, headers: headers }

    context 'when spot rating exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the rating' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when spot does not exist' do
      let(:spot_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Spot/)
      end
    end

    context 'when spot rating does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rating/)
      end
    end
  end

  # Test suite for POST /api/spots/:spot_id/ratings
  describe 'POST /api/spots/:spot_id/ratings' do
    let(:valid_attributes) { { score: 80,
                               created_by: user.id.to_s,
                               review_title: "Great Spot by the sea",
                               review_body: "There's an annoying Lion though, and they gave me a funny hat"}.to_json }

    context 'when request attributes are valid' do
      before { post "/api/spots/#{spot_id}/ratings", params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/api/spots/#{spot_id}/ratings", params: {},  headers: headers  }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Score can't be blank/)
      end
    end
  end

  # Test suite for PUT /api/spots/:spot_id/ratings/:id
  describe 'PUT /api/spots/:spot_id/ratings/:id' do
    let(:valid_attributes) { { score: 60 }.to_json }
    before { put "/api/spots/#{spot_id}/ratings/#{id}", params: valid_attributes, headers: headers }
    context 'when rating exists' do

      it 'updates the rating' do
        expect(json['score']).to eq(60)
        updated_rating = Rating.find(id)
        expect(updated_rating.score).to match(60)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the rating does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Rating/)
      end
    end
  end

  # Test suite for DELETE /api/spots/:id/ratings/:id
  describe 'DELETE /api/spots/:id/ratings/:id' do
    before { delete "/api/spots/#{spot_id}/ratings/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end