require 'Oystercard'

describe Oystercard do
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

  it 'deducts fare from card' do
    expect { subject.deduct(5) }.to change{ subject.balance }.by -5
  end

  it 'checks for in_journey? to be false' do
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it 'returns an error if card does not have sufficient balance' do
    expect { subject.touch_in}.to raise_error("Insufficient funds.")
  end
end