require 'Oystercard'

describe Oystercard do
  it 'checks that the card has a balance' do
    expect(subject.balance).to eq 0
  end
end