#require_relative '../service/shelf_service'

class DeskController < ApplicationController

=begin 
  #
    REQUEST
      order: 9 <-- consult, return, lend, buy, sell
      name: "", 
      person_id: 9,
      books: [id, id...]
  
    RESPONSE
      ticket: 999
      state: 9
      message: ""
      books: [sum, sum...]
  #
=end

protected
    def set_desk
      if (valid_order() == true)
        # find books@books = "[6, 7, 8, 9]"
        puts "\ncall a Service"
        #
        #DeskService.new(params)
        DeskService.call(params)
      end
=begin      
      @state = 1
      @owner = Client.find_by("name == ?", params[:owner][:name])
      @message = (@owner != nil) ? "" : "invalid ticket's owner"
      @books = '[]'
      #
      @order = params[:order]
      @person = 0 # @owner.person_id
      #
      # consult only
      if ((@person == 0) && (@message != ""))
        # find books
        #params[:books].each do |i| do
      end
=end      
    end

    def valid_order 
      #if (params[:order] == nil)
      #if ((params[:order] < 0) && (params[:order] > 3))
      @order = params[:order].to_i
      if (!@order.between?(1, 3))
        @order_ticket = ""
        @state = 99
        @message = "order must be: (1: consult), (2: return), (3: buy) OR (4: sell)"
        return false

      else 
        @order_ticket = "#{@order}-#{Time.now.to_i}"
        #
        @owner = Client.find_by("name == ?", params[:name])
        @message = (@owner != nil) ? "Welcome #{@owner[:name]}" : "client not found"
        @state = (@owner != nil) ? 0 : 99
        return (@state == 0)
      end 
    end

    def get_response
      {
        ticket:@order_ticket,
        order:@order,
        state:@state,
        message:@message,
        books:@books
      }
    end

    #def desk_params
      #params.require().permit(:order, :name, :person_id)
      #params.require(:order, :name, :person_id)
    #end
end