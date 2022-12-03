YEAR = 2022
DAY  = 2

INPUT_FILENAME = "%s/%02d/input.txt" % [YEAR, DAY]

WIN_CONDITIONS = {
  "A" => "C",  # Rock vs Scissors
  "B" => "A",  # Paper vs Rock
  "C" => "B"   # Scissors vs Paper
}

LOSE_CONDITIONS = WIN_CONDITIONS.invert

POINTS_FOR_SYMBOL = {
  "A" => 1,
  "B" => 2,
  "C" => 3,
}

POINTS_FOR_CONDITION = {
  "win"  => 6,
  "draw" => 3,
  "lose" => 0,
}

CONDITIONS = {
  "X" => "lose",
  "Y" => "draw",
  "Z" => "win"
}

def calculate_points_part1()
  sum = 0
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    line = line.sub('X', 'A').sub('Y', 'B').sub('Z', 'C')

    opponent = line[0];
    response = line[2];

    sum += POINTS_FOR_SYMBOL[response]

    if WIN_CONDITIONS[response] == opponent
      sum += POINTS_FOR_CONDITION["win"]
    elsif opponent == response
      sum += POINTS_FOR_CONDITION["draw"]
    else
      sum += POINTS_FOR_CONDITION["lose"]
    end
  end
  puts sum.to_s
end

def calculate_points_part2()
  sum = 0
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    opponent = line[0];
    response = line[2];

    if CONDITIONS[response] == "lose"
      response = response.sub(response, WIN_CONDITIONS[opponent])
    elsif CONDITIONS[response] == "draw"
      response = response.sub(response, opponent)
    elsif CONDITIONS[response] == "win"
      response = response.sub(response, LOSE_CONDITIONS[opponent])
    end

    sum += POINTS_FOR_SYMBOL[response]

    if WIN_CONDITIONS[response] == opponent
      sum += POINTS_FOR_CONDITION["win"]
    elsif opponent == response
      sum += POINTS_FOR_CONDITION["draw"]
    else
      sum += POINTS_FOR_CONDITION["lose"]
    end
  end
  puts sum.to_s
end

puts "part 1: "
calculate_points_part1()
puts "part 2: "
calculate_points_part2()
