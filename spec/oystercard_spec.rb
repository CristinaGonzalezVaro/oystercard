require 'Oystercard'

describe Oystercard do
  #let(:station) {double :Piccadilly}
  it 'checks that the card has a balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'allows the card to be topped-up' do
      expect { subject.top_up(5) }.to change{ subject.balance }.by 5
    end

    it 'returns an error if the new balance is over the limit' do
      expect { subject.top_up(100) }.to raise_error( "Maximum balance reached")
    end
  end

  it 'checks for in_journey? to be false' do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it 'returns an error if card does not have sufficient balance' do
    station = double("station")
    expect { subject.touch_in(station)}.to raise_error("Insufficient funds.")
  end

  it 'deducts the fare after travel' do
    expect { subject.touch_out }.to change { subject.balance }.by -1
  end

  it 'touching in records the station' do
    station = double("station")
    subject.top_up(5)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end

end

