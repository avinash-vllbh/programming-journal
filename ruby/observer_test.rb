# Sample file to test Observer pattern
# http://ruby-doc.org/stdlib-1.9.3/libdoc/observer/rdoc/Observable.html
require "observer"

class Stock
  include Observable
  attr_accessor :price
  def initialize symbol, price 
    @symbol = symbol 
    @price = price 
  end
    
  def run 
    lastPrice = nil 
    2.times do 
      @price = @price+Random.rand(11) 
      print "Current price: #{price}\n" 
      if @price != lastPrice 
        # Set the changed of the object
        changed
        lastPrice = @price
        # Notify the observers about changed state.
        notify_observers(Time.now, @price) 
       end
     end 
    end 
  end
 
  class Warner
     def initialize stock  
     stock.add_observer(self)   # all warners are observers     
  end   
end 
  
class SMSAlert < Warner     
  def update time, price       # callback for observer         
    print "--- #{time.to_s}: SMS Alert for price: #{price}\n"     
  end   
end  

stock = Stock.new("TST", 300)
# SMSAlert is now added to list of observers of stock
SMSAlert.new(stock) 
stock.run