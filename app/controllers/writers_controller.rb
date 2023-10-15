class WritersController < ApplicationController
  before_action :set_writer, only: %i[ show update destroy ]

  # GET /writers
  def index
    local = params[:writer].to_s
    if (local == "{}") or (local == "")
      #local = "\"id\": 0, \"name\": \"count:#{Genre.count}\""
      local = Writer.all

    else 
      item = Writer.find_by("name == ?", params[:writer][:name])
      if (item == nil) 
        local = "{\"id\": 0, \"name\": \"not found\"}" 
      else 
        local = "{\"id\": #{item.id}, \"name\": \"#{item.name}\"}"
      end
    end
    render json: local
=begin
    @writers = Writer.all
    render json: @writers
=end
end

  # GET /writers/1
  def show
    render json: @writer
  end

  # POST /writers
  def create
    @writer = Writer.new(writer_params)

    if @writer.save
      render json: @writer, status: :created, location: @writer
    else
      render json: @writer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /writers/1
  def update
    if @writer.update(writer_params)
      render json: @writer
    else
      render json: @writer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /writers/1
  def destroy
    #@books = Book.find_by_writer_id(@writer.id)
    #@books.each do |book|
    #  book.destroy
    #end
    @writer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writer
      @writer = Writer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def writer_params
      params.require(:writer).permit(:name)
    end
end
