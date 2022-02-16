require "open-uri"

links = File.open("links.txt").read.split ","

index_data = []

i = 1

links.each do |link|
  data = URI.open(link).read

  file = File.new("./archive/выкачка-#{i}", "w")
  file.write(data)
  file.close

  index_data.push("#{i} - #{link}")

  i += 1
end

file = File.open("index.txt", "w")

file.write(index_data.join("\n"))
