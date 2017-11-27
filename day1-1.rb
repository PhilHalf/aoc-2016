input = ''
File.open('inputs/day1.txt') {|f|
  f.each_line {|line|
    input += line
  }
}

commands = input.split(', ')

x_position = 0
y_position = 0

headings = [:north, :east, :south, :west]
heading_index = 0;  # Start facing north

commands.each {|command|
  direction = command[0]
  distance = command[1, command.length - 1].to_i

  if direction == 'L'
    heading_index -=1
    heading_index = headings.length - 1 if (heading_index < 0)

  elsif direction == 'R'
    heading_index += 1
    heading_index = 0 if (heading_index >= headings.length)
      
  end

  case headings[heading_index]
  when :north
    y_position += distance
  when :east
    x_position += distance
  when :south
    y_position -= distance
  when :west
    x_position -= distance
  end
}

puts 'Total distance: ' + (x_position.abs() + y_position.abs()).to_s