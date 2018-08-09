# spec/requests/ratings_spec.rb
require 'rails_helper'

RSpec.describe 'Ratings API' do
  # Initialize the test data
  let!(:spot) { create(:spot) }
  let!(:ratings) { create_list(:rating, 20, spot_id: spot.id) }
  let(:spot_id) { spot.id }
  let(:id) { ratings.first.id }

  # Test suite for GET /spots/:spot_id/ratings
  describe 'GET /spots/:spot_id/ratings' do
    before { get "/spots/#{spot_id}/ratings" }

    context 'when spot exists' do
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

  # Test suite for GET /spots/:spot_id/ratings/:id
  describe 'GET /spots/:spot_id/ratings/:id' do
    before { get "/spots/#{spot_id}/ratings/#{id}" }

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

  # Test suite for POST /spots/:spot_id/ratings
  describe 'POST /spots/:spot_id/ratings' do
    let(:valid_attributes) { { score: 80,
                               created_by: '1',
                               review_title: "Great Spot by the sea",
                               review_body: "There's an annoying Lion though, and they gave me a funny hat"} }

    context 'when request attributes are valid' do
      before { post "/spots/#{spot_id}/ratings", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/spots/#{spot_id}/ratings", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Score can't be blank/)
      end
    end
  end

  # Test suite for PUT /spots/:spot_id/ratings/:id
  describe 'PUT /spots/:spot_id/ratings/:id' do
    let(:valid_attributes) { { score: 60 } }
    before { put "/spots/#{spot_id}/ratings/#{id}", params: valid_attributes }
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

  # Test suite for DELETE /spots/:id/ratings/:id
  describe 'DELETE /spots/:id' do
    before { delete "/spots/#{spot_id}/ratings/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end