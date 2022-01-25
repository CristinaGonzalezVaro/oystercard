class Oystercard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_travel = false
  end

  def top_up(amount)
    @balance += amount
    raise "Maximum balance reached" if @balance > MAXIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_travel 
  end

  def touch_in
    raise "Insufficient funds." if @balance < MINIMUM_FARE
    @in_travel = true
  end

  def touch_out
    @in_travel = false
  end

end