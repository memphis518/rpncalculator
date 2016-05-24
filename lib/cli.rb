# CLI adds basic parsing of input from the command line
module CLI
  def parse_input(input)
    input.chomp! unless input.nil?
    fail Interrupt if input.nil? || input == 'q'
    input
  end
end
