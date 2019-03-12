require 'date'

class Creditcard
  attr_reader :apr, :limit, :opened 
  attr_accessor :balance, :transactions, :charges

		def initialize(apr, limit, _date = Date.today)
		  @apr = (apr / 100.0 / 365)
		  @limit = limit
		  @balance = 0
		  @transactions = {}
		  @opened = Date.today.to_s
		  @activity = @transactions[Date.today.to_s] = []
		end 

    def add_charge(amount, _date = Date.today)
		    unless @balance + amount > limit
			   @balance += amount
		    else 
				 raise ArgumentError.new("Over Limit!")
		    end
		   @activity << -amount
	  end
   
    def add_payment(amount, _date = Date.today)
			   @balance += amount
		     @activity << amount
	  end

end 

credit = Creditcard.new(35, 1000)
credit.add_charge(25)
credit.add_charge(22)
credit.add_payment(14)
p credit.balance
p credit.transactions



