require_relative 'input_data'

def fetch_data
  @fetch_data ||= InputData.new(session: ARGV[1], day: 2).fetch_input
end

def task_1
  pass_count = 0

  fetch_data.each_line do |line|
    datum = line.split(' ')
    min_max = datum.first.split('-')
    num_of_char = datum[2].count(datum[1][0])
    pass_count+= 1 if num_of_char >= min_max[0].to_i && num_of_char <= min_max[1].to_i
  end

  puts pass_count
end

def task_2
  pass_count = 0

  fetch_data.each_line do |line|
    datum = line.split(' ')
    password = datum.last
    letter = datum[1][0]
    pos = datum.first.split('-').map { |num| num.to_i - 1 }

    pass_count += 1 if [password[pos[0]] == letter, password[pos[1]] == letter].one?
  end

  puts pass_count
end

send(ARGV[0])
