class ClientsController < ApplicationController
    before_action :set_client, only: %i[ show update destroy ]
  
    # GET /clients
    def index
      @clients = Client.all
      render json: @clients, status: :ok
    end
  
    # GET /clients/1
    def show
      # @error must be set in 'set_book'
      if (@error != :ok)  
        render json: @client.errors, status: @error
  
      else 
        render json: "{\"id\": #{@client.id}, \"name\": \"#{@client.name}\"}", 
          status: @error
      end
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
      # @error must be set in 'set_book'
      if (@error != :ok)  
        render json: @client.errors, status: @error
  
      else 
        if (@client.update(client_params))
          render json: @client
        end
      end 
    end
  
    # DELETE /clients/1
    def destroy
      # @error must be set in 'set_book'
      if (@error != :ok)  
        render json: @client.errors, status: @error
  
      else 
        @client.destroy
        render status: :ok
      end 
      #@client.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_client
        begin
          #if (params[:action] == "create")
            #puts "\nCTRL params #{params.to_s}"    
          #end 

          @error = :unprocessable_entity 
          id = (params[:action] == "show") ? params[:id] : params[:client][:id]
          if (id == nil)
            raise "This is an exception 'id' must be provided."
  
          else
            @error = :no_content
            @client = Client.find(id) 
            @error = :ok
          end
  
        rescue => e  
          @client = Client.new
          @client.errors.add("#{@error}", e.message)
        end  
      end
  
      # Only allow a list of trusted parameters through.
      def client_params
        params.require(:client).permit(:name, :email, :phone)
      end
  end
  