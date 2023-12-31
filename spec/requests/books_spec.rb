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

RSpec.describe "/books", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.

  let(:valid_attr_id) {
    x = rand(9999999)
    writer = create(:writer)
    genre = create(:genre)
    { 
      title: "Mocking_Title_#{x}",
      writer_id: writer[:id], #121, #Writer.all.sample.id,
      genre_id: genre[:id], #67, #Genre.all.sample.id,
      quantity: 9,
      acquisition_date: Faker::Date.between(from: 2.years.ago, to: 2.weeks.ago)
    }
  }

  let(:invalid_attributes) {
    { title: '' }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "model tests..." do
    it "testing: model, attributes  & FactoryBot(build/create)" do
      attr_book = Book.create! valid_attr_id
      expect(attr_book).to be_a(Book)
      #
      build_book = build(:book)
      expect(build_book).to be_a(Book)
      #
      create_book = create(:book)  
      expect(create_book).to be_a(Book)
      #skip('NOT implemented')
    end
  end
  
  describe "GET /index" do
    it "renders a successful response" do
      get books_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = Book.create! valid_attr_id
      get book_url(book), as: :json
      expect(response).to have_http_status(:ok)
    end
    it "with 204 HTTP 'NOT found' code for the book" do
      # an not possible id to the db
      my_url = book_url("-99")
      #puts "RSPEC #{my_url}"
      get my_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:no_content)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do

      it "creates a new Book" do
        expect {
          post books_url,
               params: { book: valid_attr_id }, 
               headers: valid_headers, as: :json
        }.to change(Book, :count).by(1)
      end

      it "renders a JSON response with the new book" do
        post books_url,
             params: { book: valid_attr_id }, 
             headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post books_url,
               params: { book: invalid_attributes }, as: :json
        }.to change(Book, :count).by(0)
      end

      it "renders a JSON response with errors for the new book" do
        post books_url,
             params: { book: invalid_attributes }, 
             headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested book" do
        book = Book.create! valid_attr_id
        #my_url = books_url(book)
        #puts "\nRSPEC url:[#{my_url}]"
        patch book_url(book),
              params: { book: book }, 
              headers: valid_headers, as: :json
        book.reload
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end

      it "with 204 HTTP 'NOT found' code for the book" do
        # an id not possible to the db
        book = Book.new(id: -1, title: nil)
        patch book_url(book),
              params: { book: book }, headers: valid_headers, as: :json
        expect(response).to have_http_status(204)
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the book" do
        # an id not possible to the db
        book = Book.new(id: -1, title: nil)
        patch book_url(book),
              params: { book: invalid_attributes }, 
              headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attr_id
      expect {
        delete book_url(book), 
            params: { book: book }, 
            headers: valid_headers, as: :json
      }.to change(Book, :count).by(-1)
    end

    it "HTTP 204 'NOT found' code to the requested book" do
      # an id not possible to the db
      book = Book.new(id: -1, title: nil)
      delete book_url(book), 
        params: { book: book }, headers: valid_headers, as: :json
      expect(response).to have_http_status(204)
    end
  end
end
