YEAR = 2022
DAY  = 1

html_filename = "%s/%02d/input.txt" % [YEAR, DAY]

elves = []
sum = 0

File.open(html_filename).each(sep="\n") do |line|

  if line.chomp.empty?
    elves.append(sum)
    sum = 0
  end

  sum = line.to_i + sum
end

puts "Top elve is carrying: #{elves.sort[-1]} calories\n"
puts "Top 3 elves are carrying: #{elves.sort[-3..-1].sum} calories\n"
