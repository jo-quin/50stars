

# Save all lines of stars in an array stars_lines
stars_lines = []

File.foreach("stars.txt") { |line|
  line = line.split(' ')
  stars_lines<<line
}

# for each line in more_stars.txt
more_stars = []

File.foreach("more_stars.txt") { |line|  
  star_name = line.split(' ')[-1]
  more_stars<<star_name 
}

# split line and check if items in stars_lines

new_stars = []

more_stars.each do |star|
  if stars_lines.flatten.include?(star)
    new_stars<<star
  end
end

puts more_stars.difference(new_stars)
