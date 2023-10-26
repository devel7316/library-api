require_relative 'desk_controller'

module Desk
  #before_action :set_desk, only %i[ index ]

  class ConsultController < DeskController
    before_action :set_desk
    
    #GET /consult
    def index
      #render json: params, status: :ok
      render json: get_response, status: :ok
    end

  end  
end 

