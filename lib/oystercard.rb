class Oystercard
  attr_reader :balance, :entry_station, :journeys
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = {}
  end

  def top_up(amount)
    @balance += amount
    raise "Maximum balance reached" if @balance > MAXIMUM_BALANCE
  end

  private  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise "Insufficient funds." if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys[@entry_station] = station
    @entry_station = nil
  end

end



