class ShelvesController < ApplicationController
  before_action :set_shelf, only: %i[ show update destroy ]

  # GET /shelves
  def index
    #puts "\nCTRL /shelves INDEX"
    @shelves = Shelf.all
    render json: @shelves, status: :ok
  end

  # GET /shelves/1
  def show
    #puts "\nCTRL /shelves SHOW"
    # @error must be set in 'set_book'
    if (@error != :ok)  
      render json: @shelf.errors, status: @error

    else 
      render json: "{\"id\": #{@shelf.id}, \"start_date\": \"#{@shelf.start_date}\"}", 
        status: @error
    end
    #render json: @shelf
  end

  # POST /shelves
  def create
    @shelf = Shelf.new(shelf_params)
    #puts "\nPOST /shelves create:[#{@shelf.as_json}]"
    if @shelf.save
      render json: @shelf, status: :created, location: @shelf
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shelves/1
  def update
    # @error must be set in 'set_book'
    if (@error != :ok)  
      render json: @shelf.errors, status: @error

    else 
      if (@shelf.update(shelf_params))
        render json: @shelf
      end
    end 
  end

  # DELETE /shelves/1
  def destroy
    # @error must be set in 'set_book'
    if (@error != :ok)  
      render json: @shelf.errors, status: @error

    else 
      @shelf.destroy
      render status: :ok
    end 
    #@book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf

      @error = :unprocessable_entity 
      begin
        id = (params[:action] == "show")  ? params[:id] : params[:shelf][:id]
        if (id == nil)
          raise "This is an exception 'id' must be provided."

        else
          @error = :no_content
          @shelf = Shelf.find(id) 
          @error = :ok
        end

      rescue => e  
        @shelf = Shelf.new
        @shelf.errors.add("#{@error}", e.message)
      end  
    end

    # Only allow a list of trusted parameters through.
    def shelf_params
      params.require(:shelf).permit(:book_id, :client_id, :quantity, :start_date, :end_date, :devolution_date, :status_id)
    end
end
