#! /usr/bin/ruby
$LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
require 'rpn_calculator'
require 'cli'

include CLI

calculator = RPNCalculator.new

loop do
  begin
    print '> '
    input = parse_input(gets)
    puts calculator.calculate(input)
  rescue Interrupt
    break
  rescue RuntimeError => e
    puts "Error: #{e.message} \n"
  end
end
