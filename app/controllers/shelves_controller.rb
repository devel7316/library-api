class ShelvesController < ApplicationController
  before_action :set_shelf, only: %i[ show update destroy ]

  # GET /shelves
  def index
    @shelves = Shelf.all

    render json: @shelves
  end

  # GET /shelves/1
  def show
    render json: @shelf
  end

  # POST /shelves
  def create
    @shelf = Shelf.new(shelf_params)

    if @shelf.save
      render json: @shelf, status: :created, location: @shelf
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shelves/1
  def update
    if @shelf.update(shelf_params)
      render json: @shelf
    else
      render json: @shelf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shelves/1
  def destroy
    @shelf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf
      @shelf = Shelf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelf_params
      params.require(:shelf).permit(:book_id, :client_id, :quantity, :start_date, :end_date, :devolution_date, :status_id)
    end
end
