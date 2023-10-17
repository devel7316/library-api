class WritersController < ApplicationController
  before_action :set_writer, only: %i[ show update destroy ]

  # GET /writers
  def index
    #puts "INDEX #{params[:writer]}"
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
    #puts "SHOW id[#{params[:id]}] @writer[#{@writer.as_json}]"
    #render json: @writer
    render json: "{\"id\": 0, \"name\": \"not implemented\"}" 
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
    #puts "UPDATE id[#{params[:id]}] @writer[#{@writer.as_json}]"  
    if (@writer == nil)
      #puts "UPDATE id[#{params[:id]}] NOT found"  
      render json: "{\"id\": 0, \"name\": \"NOT found\"}", :status => '204'

    else 
      if @writer.update(writer_params)
        render json: @writer
      else
        render json: @writer.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /writers/1
  def destroy
    #puts "CTRL [#{params[:genre]}]"
    if (@writer == nil) 
      render :status => '204'

    else     
      @writer.destroy
      render status: :ok
    end 
    #@writer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writer
      #@writer = Writer.find(params[:id])
      @writer = Writer.find_by("id == ?", params[:id])
    end

    # Only allow a list of trusted parameters through.
    def writer_params
      #params.require(:writer).permit(:name)
      params.require(:writer).permit(:id, :name)
    end
end
