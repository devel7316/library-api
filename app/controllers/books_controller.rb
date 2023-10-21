class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index

    local = params[:book].to_s
    if (local == "{}") or (local == "")
      local = Book.all

    else 
      @book = Book.find_by("title == ?", params[:title])  
      if (@book == nil) 
        local = "{\"id\": 0, \"title\": \"not found\"}" 
      else 
        local = "{\"id\": #{@book.id}, \"title\": \"#{@book.title}\"}"
      end
    end
    render json: local
=begin    
    @books = Book.all
    render json: @books
=end
  end

  # GET /books/1
  def show
    # @error must be set in 'set_book'
    #puts "\nCTRL /show params:[#{params.to_s}]"
    if (@error != :ok)  
      render json: @book.errors, status: @error

    else 
      render json: "{\"id\": #{@book.id}, \"title\": \"#{@book.title}\"}", 
        status: @error
    end
    #render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)
    #puts "\nCTRL POS /books [#{book_params.to_s}]"
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    # @error must be set in 'set_book'
    if (@error != :ok)  
      render json: @book.errors, status: @error

    else 
      if (@book.update(book_params))
        render json: @book
      end
    end 
  end

  # DELETE /books/1
  def destroy
    # @error must be set in 'set_book'
    if (@error != :ok)  
      render json: @book.errors, status: @error

    else 
      @book.destroy
      render status: :ok
    end 
    #@book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book

      @error = :unprocessable_entity 
      begin
        if (params[:action] == "show") 
          bad = (params[:id] == nil)
          #puts "\nshow//:[#{params.to_s}]"

        else 
          bad = (params[:book][:id] == nil) 
        end       
        #puts "\naction:[#{params[:action]}] bad:[#{bad}]"

        if (bad)
          raise "This is an exception 'id' must be provided."

        else 
          @error = :no_content
          @book = Book.find(params[:id])  
          @error = :ok
        end

      rescue => e  
        @book = Book.new
        @book.errors.add("#{@error}", e.message)
      end  
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(
        :title, :writer_id, :genre_id, :quantity, :acquisition_date)
    end
end
