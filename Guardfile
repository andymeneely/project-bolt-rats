group :default do
  guard 'rake', :task => 'default' do
    watch %r{data/.*\.xlsx$}
    watch %r{data/.*\.csv$}
    watch %r{lib/.*\.rb$}
    watch %r{.*\.yml}
    watch %r{img/.*\.svg$}
  end
end

group :rules do
  guard 'rake', :task => 'rules' do
    watch %r{data/.*\.xlsx$}
    watch %r{data/.*\.csv$}
    watch %r{lib/.*\.rb$}
    watch %r{.*\.yml}
    watch %r{.*\.md}
    watch %r{img/.*\.svg$}
  end
end
