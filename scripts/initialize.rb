require 'json'
require 'httparty'
require 'fileutils'
require 'nokogiri'
require 'reverse_markdown'
require 'dotenv'

Dotenv.load(".env")
Dotenv.require_keys("SESSION")

AOC = "https://adventofcode.com/"
SESSION_KEY = ENV['SESSION']

# https://adventofcode.com/2021/day/1
def download_readme(year, day)
  dirname = "%s/%02d/" % [year, day]
  html_filename = 'README.HTML'
  url = AOC + year + "/day/" + day

  FileUtils.mkdir_p(dirname)

  File.open(dirname + html_filename, "wb") do |readme_html_file|
      response = HTTParty.get(url, {
        headers: { "Cookie" => "session=%s;" % [SESSION_KEY] }
        }
      )
      if (response.code == 200) then
        content = Nokogiri::HTML.parse(response.body)
        readme_html_file.write(content.xpath("//article").inner_html)
        puts "Downloaded readme"
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



def get_input(year, day)
  dirname = "%s/%02d/" % [year, day]
  input_filename = 'input.txt'
  url = AOC + year + "/day/" + day + "/input"

  File.open(dirname + input_filename, "wb") do |input_file|
    response = HTTParty.get(url, {
      headers: { "Cookie" => "session=%s;" % [SESSION_KEY] }
      }
    )

    if (response.code == 200) then
      input_file.write(response.body)
      puts "Downloaded input"
    else
      puts "Looks like there is no puzzle for today (yet?)"
      puts "Download failed: %s - %s" % [response.code, response.message]
    end
  end
end


def create_solution_blueprint(year, day)
  dirname = "%s/%02d/" % [year, day]
  solution_filename = 'solution.rb'

  file_already_exists = File.exists?(dirname + solution_filename)
  if !file_already_exists
    FileUtils.cp("scripts/solution_blueprint.rb", dirname + solution_filename)
  end
end


YEAR = Time.new.year
MONTH = Time.new.month
DAY = Time.new.day

if MONTH != 12
  puts "Sorry, you'll have to wait for december"
elif DAY > 25
  puts "Looks like the AoC ended some days ago"
else
  create_solution_blueprint(YEAR.to_s, DAY.to_s)
  #download_readme(YEAR.to_s, DAY.to_s)
  #get_input(YEAR.to_s, DAY.to_s)
end

