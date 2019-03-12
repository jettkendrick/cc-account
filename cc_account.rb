require 'date'
require "active_support/core_ext/date_and_time/calculations"


class Creditcard
  attr_reader :apr, :limit, :opened 
  attr_accessor :balance, :transactions, :charges, :activity

		def initialize(apr, limit, _date = Date.today)
		  @apr = (apr / 100.0 / 365)
		  @limit = limit
		  @balance = 0
		  @transactions = {}
		  @opened = Date.today.to_s
		  @activity = @transactions[@opened] = []
		end

		def what_day
			 day = rand(30)
			@opened = (Date.today + day).to_s
			@activity = @transactions[@opened] = []
		end 

    def add_charge(amount)
		    unless @balance + amount > @limit
			   @balance += amount
		    else 
				 raise ArgumentError.new("Over Limit!")
		    end
		   @activity << -amount
	  end
   
    def add_payment(amount)
			   @balance += amount
		     @activity << amount
	  end

	  def next 
	  	@opened = (Date.today + 1).to_s
	  end 
end

credit = Creditcard.new(35, 1000)
credit.add_charge(25)
credit.add_charge(22)
credit.what_day
credit.add_payment(14)
p credit.balance
p credit.transactions





