require 'date'
class Creditcard
  attr_reader :apr, :limit, :opened 
  attr_accessor :balance, :transactions, :interest, :activity, :day

  def initialize(apr, limit, _date = Date.today)
	   @apr = (apr / 100.0 / 365)
		  @interest = 0
		  @limit = limit
		  @balance = 0
		  @transactions = {}
		  @day = 0
		  @opened = Date.today.to_s
		  @activity = @transactions[@opened] = []
	 end

	 def day_progess(days)
		  @day = days
		  if @balance > 0 
		    @interest += balance * @apr * days
		  end
	 end 

	 def add_charge(amount)
		  unless @balance + amount > @limit
			   @balance += amount
		 else 
			  raise ArgumentError.new("Over Limit!")
		  end
		  @opened = (Date.today + @day).to_s
		  if @transactions.has_key?(@opened)
		    @activity << -amount
		else
		  @activity = @transactions[@opened] = []
		  @activity << -amount
		  end  
	 end
   
  def add_payment(amount)
		  @balance -= amount
		  @opened = (Date.today + @day).to_s
		  if @transactions.has_key?(@opened)
		    @activity << amount
		else
		  @activity = @transactions[@opened] = []
			 @activity << amount
		  end
	 end

	 def view_activity 
		  p @transactions
	 end 


	 def check_balance(day_number)
		  if day_number % 30 == 0 
     	(balance + interest).round(2)
   	else
      balance.round(2)
    end 
  end
end







