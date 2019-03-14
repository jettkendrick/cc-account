require 'date'
require 'minitest/autorun'
require './cc_account'

class CardTest < Minitest::Test

  def test_scenario_1
	   credit = Creditcard.new(35, 1000)
		  credit.add_charge(500)
		  credit.day_progess(30)
		  assert_equal 514.38, credit.check_balance(30)
	 end		
	
	 def test_scenario_2 
		  credit = Creditcard.new(35, 1000)
		  credit.add_charge(500)
		  credit.day_progess(15)
		  credit.add_payment(200)
		  credit.day_progess(10)
		  credit.add_charge(100)
		  credit.day_progess(5)
		  assert_equal 411.99, credit.check_balance(30)
	 end

  def test_create_account
    credit = Creditcard.new(35, 1000)
    assert_equal 0.0009589041095890411, credit.apr
    assert_equal 1000, credit.limit
    assert_equal Date.today.to_s, credit.opened
  end

  def test_over_limit_add_charge
    credit = Creditcard.new(35, 1000)
    assert_raises (ArgumentError) { credit.add_charge(1001) }
  end

  def test_day_progress_interest
  	 credit = Creditcard.new(35, 1000)
  	 credit.add_charge(500)
  	 assert_equal 7.191780821917808, credit.day_progess(15)
  end 
end 