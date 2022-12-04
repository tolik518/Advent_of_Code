YEAR = 2022
DAY  = 4

INPUT_FILENAME = "%s/%02d/input.txt" % [YEAR, DAY]

def part1()
  sum = 0
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    elf_one, elf_two = line.split(",").map{
      |elf| first, last = elf.split("-").map{|value| value.to_i}
      (first..last).to_a
    }
    if (elf_one & elf_two) == elf_one || (elf_one & elf_two) == elf_two
      sum = sum +1
    end
  end
  sum
end

def part2()
  sum = 0
  File.open(INPUT_FILENAME).each(sep="\n") do |line|
    elf_one, elf_two = line.split(",").map{
      |elf| first, last = elf.split("-").map{|value| value.to_i}
      (first..last).to_a
    }

    if !(elf_one & elf_two).empty?
      sum = sum + 1
    end
  end
  sum
end

puts "part one: #{part1()}"
puts "part one: #{part2()}"
