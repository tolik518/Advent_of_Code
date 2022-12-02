YEAR = 2022
DAY  = 2

html_filename = "%s/%02d/input.txt" % [YEAR, DAY]

sum = 0

conditions = {
  "A": "C",  # Rock vs Scissors
  "B": "A",  # Paper vs Rock
  "C": "B"   # Scissors vs Paper
}

File.open(html_filename).each(sep="\n") do |line|
  line = line.sub('X', 'A') # Rock
  line = line.sub('Y', 'B') # Paper
  line = line.sub('Z', 'C') # Scissors

  opponent = line[0];
  response = line[2];

  if response    == "A" # Rock
    sum += 1
  elsif response == "B" # Paper
    sum += 2
  elsif response == "C" # Scissors
    sum += 3
  end

  if conditions[response.to_sym] == opponent
    sum += 6 #win
  elsif opponent == response
    sum += 3 #draw
  else
    sum += 0 #lost
  end
end

puts sum.to_s
