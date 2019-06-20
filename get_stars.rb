count = 0 

month = ARGV[0]
# time = ARGV[]
# location = ARGV[]
MONTHS = {
  april: 2,
  may: 4,
  june: 6,
  july: 8,
  august: 10,
  september: 12,
  october: 14,
  november: 16,
  december: 18,
  january: 20,
  february: 22
}
def hours(month)
  return MONTHS[month.to_sym]
end

File.foreach("stars.txt") { |line|
  line = line.split(' ')
  dec = line[-1].to_f
  wtl = dec - 51.49 # London latitude 
  ra_june_21st = line[-3].split('h')[0].to_i - hours(month) # 2 hours a month from March 21st
  if wtl >= -90
    if 13 > ra_june_21st && ra_june_21st > 0 # non circumpolar stars that can be seen at night
      puts "#{line[1]}-> RA: #{line[-3]} #{line[-2]} RA-June-21st: #{ra_june_21st}h || Dec: #{line[-1]} WTL (London): #{'%.2f' % wtl}"
      puts 
      count += 1
    elsif (90 - dec) <= 50 # circumpolar stars!
      puts "#{line[1]}-> RA: #{line[-3]} #{line[-2]} RA-June-21st: #{ra_june_21st}h || Dec: #{line[-1]} WTL (London): #{'%.2f' % wtl}"
      puts 
      count += 1
    end
  end
}

puts "#{count} stars are visible on #{month.capitalize} 21st at 9pm"