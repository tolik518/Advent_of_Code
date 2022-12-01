require 'json'
require 'httparty'
require 'fileutils'
require 'nokogiri'
require 'reverse_markdown'

AOC = "https://adventofcode.com/"

# https://adventofcode.com/2021/day/1
def download_readme(year, day)

  dirname = "%s/%02d/" % [year, day]
  html_filename = 'README.HTML'
  url = AOC + year + "/day/" + day

  FileUtils.mkdir_p(dirname)

  File.open(dirname + html_filename, "wb") do |readme_html_file|
      response = HTTParty.get(url)
      content = Nokogiri::HTML.parse(response.body)
      readme_html_file.write(content.at("article").inner_html)
      if (response.code == 200) then
        puts "Downloaded..."
      else
        puts "Looks like there is no puzzle for today (yet?)"
        puts "Download failed: %s - %s" % [response.code, response.message]
      end
  end
  convert_to_markdown(dirname, html_filename)
end

def convert_to_markdown(dirname, html_filename)
  file_data = File.read(dirname + html_filename)

  ReverseMarkdown.config do |config|
    config.unknown_tags     = :bypass
    config.github_flavored  = true
    config.tag_border  = ''
  end

  result = ReverseMarkdown.convert(file_data)
  clean_markdown = result.inspect[1..-2].gsub("\\n", "\n")

  File.open(dirname + 'README.MD', "wb") do |readme_file|
    readme_file.write(clean_markdown)
  end

  File.delete(dirname + html_filename)
end

YEAR = Time.new.year
MONTH = Time.new.month
DAY = Time.new.day

if MONTH != 12
  puts "Sorry, you'll have to wait for december"
elif DAY > 25
  puts "Looks like the AoC ended some days ago"
else
  download_readme(YEAR.to_s, DAY.to_s)
end

