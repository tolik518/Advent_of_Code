YEAR = 2022
DAY  = 4

INPUT_FILENAME = "%s/%02d/input.txt" % [YEAR, DAY]

def find_duplicates()
  sum = 0
  File.open(INPUT_FILENAME).each() do |line|
    elf_one, elf_two = line.split(",").map{
      first, last = _1.split("-").map(&:to_i)
      (first..last).to_a
    }

    unionized = (elf_one & elf_two)
    if unionized == elf_one || unionized == elf_two
      sum = sum +1
    end
  end
  sum
end

def find_overlaps()
  sum = 0
  File.open(INPUT_FILENAME).each() do |line|
    elf_one, elf_two = line.split(",").map{
      first, last = _1.split("-").map(&:to_i)
      (first..last).to_a
    }

    if (elf_one & elf_two).any?
      sum = sum + 1
    end
  end
  sum
end

puts "Part 1: #{find_duplicates()}"
puts "Part 2: #{find_overlaps()}"
