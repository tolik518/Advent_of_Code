require 'json'
require 'httparty'
require 'fileutils'
require 'nokogiri'
require 'reverse_markdown'

AOC = "https://adventofcode.com/"

# https://adventofcode.com/2021/day/1
def download_readme(year, day)

  dirname = "%s/%02d/" % [year, day]
  filename = 'README.HTML'
  url = AOC + year + "/day/" + day

  FileUtils.mkdir_p(dirname)

  File.open(dirname + filename, "wb") do |readme_html_file|
      response = HTTParty.get(url)
      readme_html_file.write(response.body)
      if (response.code == 200) then
        puts "Downloaded..."
      else
        puts "Download failed: %s - %s" % [response.code, response.message]
      end
  end
  convert_to_markdown(dirname, filename)
end

def convert_to_markdown(dirname, filename)
  file_data = File.read(dirname + filename)

  ReverseMarkdown.config do |config|
    config.unknown_tags     = :bypass
    config.github_flavored  = true
    config.tag_border  = ''
  end

  result = ReverseMarkdown.convert(file_data)

  File.open(dirname + 'README.MD', "wb") do |readme_file|
    readme_file.write(result.inspect)
  end
end


download_readme("2021", "1")

