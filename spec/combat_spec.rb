require 'combat'

describe Combat do

  let(:rng) { double("rng") }

  it 'rolls a miss' do
    expect(rng).to receive(:next).and_return(0) # Roll 1: 0%6 + 1 = 1
    expect(Combat.new(rng).attack).to eq 0
  end

  it 'returns normal for 2' do
    expect(rng).to receive(:next).and_return(1) # Roll 2
    expect(Combat.new(rng).attack).to eq 2
  end

  it 'returns normal for 3' do
    expect(rng).to receive(:next).and_return(2) # Roll 3
    expect(Combat.new(rng).attack).to eq 3
  end

  it 'returns normal for 4' do
    expect(rng).to receive(:next).and_return(3) # Roll 4
    expect(Combat.new(rng).attack).to eq 4
  end

  it 'returns normal for 5' do
    expect(rng).to receive(:next).and_return(4) # Roll 5
    expect(Combat.new(rng).attack).to eq 5
  end

  it 'handles a crit then number' do
    expect(rng).to receive(:next).and_return(5) # Roll 6
    expect(rng).to receive(:next).and_return(2) # Roll 3
    expect(Combat.new(rng).attack).to eq 9
  end

  it 'handles a crit, then crit, then number' do
    expect(rng).to receive(:next).and_return(5) # Roll 6
    expect(rng).to receive(:next).and_return(5) # Roll 6
    expect(rng).to receive(:next).and_return(2) # Roll 3
    expect(Combat.new(rng).attack).to eq 15
  end

  it 'handles a crit, then crit, then miss' do
    expect(rng).to receive(:next).and_return(5) # Roll 6
    expect(rng).to receive(:next).and_return(5) # Roll 6
    expect(rng).to receive(:next).and_return(0) # Roll 1
    expect(Combat.new(rng).attack).to eq 0
  end


end
