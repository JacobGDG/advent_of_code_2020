require_relative 'input_data'

def input_data
  @input_data ||= InputData.new(session: ARGV[0], day: 2).fetch_input
end

def one
end

def two
end

send(ARGV[1])
