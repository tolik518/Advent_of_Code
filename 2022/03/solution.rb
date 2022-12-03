YEAR = 2022
DAY  = 3

INPUT_FILENAME = "%s/%02d/input.txt" % [YEAR, DAY]

def cut_in_half(string)
  cut_in_half_regex = /.{#{string.length / 2}}/
  string.partition(cut_in_half_regex).drop(1) # drop 1 because the first item is not needed
end

def calculate_for_half_lines()
  sum = 0
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    first_half, second_half = cut_in_half(line)
    duplicate_letter = (first_half.chars & second_half.chars).join
    value = (duplicate_letter.ord - 96) % 58
    sum += value
  end
  sum
end

def calculate_for_three_lines()
  sum = 0
  strings = []
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    strings.append(line)
    if strings.count == 3
      duplicate_letter = (strings[0].chars & strings[1].chars & strings[2].chars).join
      value = (duplicate_letter.ord - 96) % 58
      sum += value
      strings = []
    end
  end
  sum
end

puts "part one: #{calculate_for_half_lines()}"
puts "part two: #{calculate_for_three_lines()}"
