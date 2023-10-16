class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show update destroy ]

  # GET /genres
  def index
    local = params[:genre].to_s
    if (local == "{}") or (local == "")
      #local = "\"id\": 0, \"name\": \"count:#{Genre.count}\""
      local = Genre.all

    else 
      item = Genre.find_by("name == ?", params[:genre][:name])
      if (item == nil) 
        local = "{\"id\": 0, \"name\": \"not found\"}" 
      else 
        local = "{\"id\": #{item.id}, \"name\": \"#{item.name}\"}"
      end
    end
    render json: local
=begin    
    @genres = Genre.all
    render json: @genres
=end    
  end

  # GET /genres/1
  def show
    #puts "SHOW"
    #render json: @genres
    render json: "{\"id\": 0, \"name\": \"not implemented\"}" 
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
=begin    
    id = params[:genre][:id]
    if (id == nil) 
      render json: {}, status: :unprocessable_entity
    else   

      if (Genre.find_by("id == ?", params[:genre][:id]) == nil)
        render json: "{\"id\": 0, \"name\": \"not found\"}", :status => '404'

      else     
        if @genre.update(genre_params)
          render json: @genre

        else
          render json: @genre.errors, status: :unprocessable_entity
        end
      end
    end  
=end    
    #if (Genre.find_by("id == ?", params[:genre][:id]) == nil)
    #
    #puts "id:[#{params[:genre][:id]}]"
    if (params[:genre][:id] == nil)
      render json: "", status: :unprocessable_entity
    
    else 
      if (@genre == nil)
        render :status => '204'
      
      else 
        if @genre.update(genre_params)
          render json: @genre
        else
          render json: @genre.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /genres/1
  def destroy
    #puts "DELETE [#{params[:genre]}]"
    if (@genre == nil) 
      render :status => '204'

    else     
      @genre.destroy
      render status: :ok
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      #@genre = Genre.find(params[:id])
      #puts "id:[#{params[:genre][:id]}]"
      @genre = Genre.find_by("id == ?", params[:genre][:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
