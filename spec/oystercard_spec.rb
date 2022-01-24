require 'Oystercard'

describe Oystercard do
  it 'checks that the card has a balance' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'allows the card to be topped-up' do
      expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
    end


  end
end