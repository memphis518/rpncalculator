require 'rpn_calculator'

RSpec.describe RPNCalculator, '#calculate' do
  before(:each) do
    @calculator = RPNCalculator.new
  end

  it 'adds correctly' do
    value = @calculator.calculate('1 2 +')
    expect(value).to eq 3
  end

  it 'subtracts correctly' do
    value = @calculator.calculate('2 1 -')
    expect(value).to eq 1
  end

  it 'multiplies correctly' do
    value = @calculator.calculate('3 2 *')
    expect(value).to eq 6
  end

  it 'divides correctly' do
    value = @calculator.calculate('6 2 /')
    expect(value).to eq 3
  end

  it 'mods correctly' do
    value = @calculator.calculate('8 5 %')
    expect(value).to eq 3
  end

  it 'performs div correctly' do
    value = @calculator.calculate('6 4 div')
    expect(value).to eq 1
  end

  it 'performs exponents correctly' do
    value = @calculator.calculate('2 4 **')
    expect(value).to eq 16
  end

  it 'handles decimals' do
    value = @calculator.calculate('2 4.2 +')
    expect(value).to eq 6.2
  end

  it 'handles negative numbers' do
    value = @calculator.calculate('2 -4 +')
    expect(value).to eq -2
  end

  it 'errors when there are not two numbers' do
    expect { @calculator.calculate('2 +') }
      .to raise_error(RuntimeError, 'Error: must have two numbers before operator')
  end

  it 'errors when invalid operator is passed' do
    expect { @calculator.calculate('2 3 blah') }
      .to raise_error(RuntimeError, 'Error: blah is not a valid operator')
  end

  it 'errors when it is an improper format' do
    expect { @calculator.calculate('2 2 3 +') }
      .to raise_error(RuntimeError, 'Error: improper format of equation')
  end
end
