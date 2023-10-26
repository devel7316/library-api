class DeskService < ApplicationService

  def call()
    #puts "\ncall with \n\t#{@args.to_s}"
    #sum = Book.sum('title').where("title == ?", @args[:book_id])
    sum = Shelf.where(book_id: @args[:book_id]).sum(:quantity)
    puts "\ncall with sum \n\t#{sum}"
  end

  private 
    def doSmt(order)
      puts "\ndo SOMETHING! #{order}"
    end 

end
