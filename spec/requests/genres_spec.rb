require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/genres", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Genre. As you add validations to Genre, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) {
    { name: 'HardMockedValue01' }
  }

  let(:invalid_attributesA) {
    {}
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # GenresController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      #
      #Genre.create! valid_attributes
      get genres_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      #genre = Genre.create! valid_attributes
      genre = Genre.create! valid_attributes
      get genre_url(genre), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Genre" do
        expect {
          post genres_url,
               params: { genre: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Genre, :count).by(1)
      end

      it "renders a JSON response with the new genre" do
        post genres_url,
             params: { genre: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Genre" do
        expect {
          post genres_url,
               params: { genre: invalid_attributes }, as: :json
        }.to change(Genre, :count).by(0)
      end

      it "renders a JSON response with errors for the new genre" do
        post genres_url,
             params: { genre: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "renders a JSON response with the genre" do
        genre = Genre.create! valid_attributes
        patch genre_url(genre),
              params: { genre: genre }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end

      it "204 HTTP 'not found' code to the requested genre" do
        #puts "UPDATE 204"
        genre = Genre.new(id: -1, name: "")
        patch genre_url(genre),
              params: { genre: genre }, headers: valid_headers, as: :json
        expect(response).to have_http_status(204)
      end
    end  

    context "with invalid parameters" do
      it "renders a JSON response with errors for the genre" do
        #puts "UPDATE invalid"
        genre = Genre.new(id: -1, name: "")
        patch genre_url(genre),
              params: { genre: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end    

  describe "DELETE /destroy" do
    let(:valid_unique) {
      x = rand(999999) 
      { name: "must be unique at this point #{x}" }
    }
    it "destroys the requested genre" do
      genre = Genre.create! valid_unique
      #puts "RSPEC [#{genre.as_json}]"
      expect {
        delete genre_url(genre), params: { genre: genre }, 
          headers: valid_headers, as: :json
      }.to change(Genre, :count).by(-1)
    end

    it "HTTP 204 'not found' code to the requested genre" do
      # it is just a record (not added into db table)
      genre = Genre.new(id: -1, name: "")
      delete genre_url(genre), 
        params: { genre: genre }, headers: valid_headers, as: :json
      expect(response).to have_http_status(204)
    end

  end
end
