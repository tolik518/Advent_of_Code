YEAR = %%YEAR%%
DAY  = %%DAY%%

INPUT_FILENAME = "%s/%02d/input.txt" % [YEAR, DAY]

def function()
  sum = 0
  File.open(INPUT_FILENAME).each() do |line|
    # content goes here
  end
  sum
end

puts "Part 1: #{function()}"
puts "Part 2: #{function()}"
