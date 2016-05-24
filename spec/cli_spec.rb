require 'cli'

include CLI

RSpec.describe CLI, '#parse_input' do
  it 'passes along string with no changes' do
    parsed = parse_input('foo bar')
    expect(parsed).to eq('foo bar')
  end

  it 'removed ending line character' do
    parsed = parse_input("foo bar\n")
    expect(parsed).to eq('foo bar')
  end

  it 'raises Interrupt if input is nil' do
    expect { parse_input(nil) }.to raise_error Interrupt
  end

  it 'raises Interrupt if input is q' do
    expect { parse_input('q') }.to raise_error Interrupt
  end
end
