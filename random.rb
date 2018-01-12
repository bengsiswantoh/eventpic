require "yaml"

file_name = "list.yml"
list = YAML.load_file(file_name)

if list["pool"].length == 0
  list["pool"] = list["done"].dup
  list["done"] = []
end

list["pool"].shuffle!
choosen = list["pool"].shift

list["done"].push(choosen)

puts "#{choosen}"
puts "pool : #{list["pool"]}"
puts "done : #{list["done"]}"

File.write(file_name, list.to_yaml)
