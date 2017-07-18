require 'combat'

describe Combat do

  let(:rng) { double("rng") }

  it 'returns normal for 2' do
    expect(rng).to receive(:next).and_return(2)
    expect(Combat.new(rng).roll).to eq 2
  end

  it 'returns normal for 3' do
    expect(rng).to receive(:next).and_return(3)
    expect(Combat.new(rng).roll).to eq 3
  end

  it 'returns normal for 4' do
    expect(rng).to receive(:next).and_return(4)
    expect(Combat.new(rng).roll).to eq 4
  end

  it 'returns normal for 5' do
    expect(rng).to receive(:next).and_return(5)
    expect(Combat.new(rng).roll).to eq 5
  end


end
