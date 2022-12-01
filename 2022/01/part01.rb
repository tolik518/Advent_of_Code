YEAR = 2022
DAY  = 1
PART = 1

filename = "%s/%02d/part%02d_input.txt" % [YEAR, DAY, PART]

highest = 0
sum = 0

File.open(filename).each(sep="\n") do |line|

  if line.chomp.empty?
    sum = 0
  end

  sum = line.to_i + sum

  if (sum > highest)
    highest = sum
  end
end

puts highest.to_s
