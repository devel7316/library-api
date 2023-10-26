class ApplicationService
    
  def self.call(args)
    puts "\n parent ApplicationService OK!"
    new(args).call
  end

  protected 
    def initialize(args)
      @args = args
    end
end