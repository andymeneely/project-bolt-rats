require 'combat'

describe Combat do

  let(:rng)   { double("rng") }
  let(:cr_hp) { 100 } # Creature has high HP so we play aggressive
  subject     { Combat.new(rng) }

  context(:attack) do
    it 'rolls a miss' do
      expect(rng).to receive(:rand).and_return(0) # Roll 1: 0%6 + 1 = 1
      expect(subject.attack(cr_hp)).to eq 0
    end

    it 'returns normal for 2' do
      expect(rng).to receive(:rand).and_return(1) # Roll 2
      expect(subject.attack(cr_hp)).to eq 2
    end

    it 'returns normal for 3' do
      expect(rng).to receive(:rand).and_return(2) # Roll 3
      expect(subject.attack(cr_hp)).to eq 3
    end

    it 'returns normal for 4' do
      expect(rng).to receive(:rand).and_return(3) # Roll 4
      expect(subject.attack(cr_hp)).to eq 4
    end

    it 'returns normal for 5' do
      expect(rng).to receive(:rand).and_return(4) # Roll 5
      expect(subject.attack(cr_hp)).to eq 5
    end

    it 'handles a crit then number' do
      expect(rng).to receive(:rand).and_return(5) # Roll 6
      expect(rng).to receive(:rand).and_return(2) # Roll 3
      expect(subject.attack(cr_hp)).to eq 9
    end

    it 'handles a crit, then crit, then number' do
      expect(rng).to receive(:rand).and_return(5) # Roll 6
      expect(rng).to receive(:rand).and_return(5) # Roll 6
      expect(rng).to receive(:rand).and_return(2) # Roll 3
      expect(subject.attack(cr_hp)).to eq 15
    end

    it 'handles a crit, then crit, then miss' do
      expect(rng).to receive(:rand).and_return(5) # Roll 6
      expect(rng).to receive(:rand).and_return(5) # Roll 6
      expect(rng).to receive(:rand).and_return(0) # Roll 1
      expect(subject.attack(cr_hp)).to eq 0
    end

    it 'crits, then crits, then quits while ahead' do
      expect(rng).to receive(:rand).and_return(5).exactly.twice
      cr_hp = 10 # should quit while ahead
      expect(subject.attack(cr_hp)).to eq 12
    end
  end

  context(:win?) do

    it 'one-shots the monster' do
      my_hp  = 10
      my_atk = 0
      cr_hp  = 10
      cr_atk = 2
      expect(rng).to receive(:rand).and_return(5) # Roll 6 CRIT!
      expect(rng).to receive(:rand).and_return(5) # Roll 6 CRIT!
      expect(rng).to receive(:rand).and_return(2) # Roll 3 (16!)
      win = subject.win?(my_hp, my_atk, cr_hp, cr_atk)
      expect(win).to be true
    end

    it 'always misses' do
      my_hp  = 100
      my_atk = 0
      cr_hp  = 1
      cr_atk = 1
      # 100 MISS rolls. Ouch.
      expect(rng).to receive(:rand).and_return(0).exactly(100).times
      win = subject.win?(my_hp, my_atk, cr_hp, cr_atk)
      expect(win).to be false
    end

    it 'loses because of atk' do
      my_hp  = 1
      my_atk = 0
      cr_hp  = 8
      cr_atk = 1
      expect(rng).to receive(:rand).and_return(0).once # MISS
      win = subject.win?(my_hp, my_atk, cr_hp, cr_atk)
      expect(win).to be false
    end

    it 'loses despite having great atk' do
      my_hp  = 1
      my_atk = 1000
      cr_hp  = 8
      cr_atk = 1
      expect(rng).to receive(:rand).and_return(0).once # MISS
      win = subject.win?(my_hp, my_atk, cr_hp, cr_atk)
      expect(win).to be false
    end

    it 'wins because of a bad roll but great atk' do
      my_hp  = 1
      my_atk = 1000
      cr_hp  = 8
      cr_atk = 1
       # ROLL 2, not enough. ATK will save us!
      expect(rng).to receive(:rand).and_return(1).once
      win = subject.win?(my_hp, my_atk, cr_hp, cr_atk)
      expect(win).to be true
    end
  end

end
