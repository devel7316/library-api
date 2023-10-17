class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show update destroy ]

  # GET /clients
  def index
    #puts "INDEX #{params[:writer]}"
    local = params[:client].to_s
    if (local == "{}") or (local == "")
      #local = "\"id\": 0, \"name\": \"count:#{Genre.count}\""
      local = Client.all

    else 
      @client = Client.find_by("name == ?", params[:name])  
      if (@client == nil) 
        local = "{\"id\": 0, \"name\": \"not found\"}" 
      else 
        local = "{\"id\": #{@client.id}, \"name\": \"#{@client.name}\"}"
      end
    end
    render json: local
=begin
    @clients = Client.all
    render json: @clients
=end    
  end

  # GET /clients/1
  def show
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    #puts "UPDATE id[#{params[:id]}] @client[#{@client.as_json}]"  
    if (@client == nil)
      puts "UPDATE NOT found"  
      render json: "{\"id\": 0, \"name\": \"NOT found\", \"email\": \"\", \"phone\": \"\"}", 
          :status => '204'

    else 
      if @client.update(client_params)
        render json: "{\"id\": #{@client.id}, \"name\": \"#{@client.name}\"}", 
            status: :ok 
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /clients/1
  def destroy
    if (@client == nil) 
      render :status => '204'

    else     
      @client.destroy
      render status: :ok
    end 
    #@client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      #@client = Client.find(params[:id])
      @client = Client.find_by("id == ?", params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :phone)
    end
end
