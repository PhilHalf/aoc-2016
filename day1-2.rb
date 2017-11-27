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

duplicate_found = false

visited = ['0,0']

commands.each {|command|
  direction = command[0]
  distance = command[1, command.length - 1].to_i

  if (direction == 'L')
    heading_index -=1
    heading_index = headings.length - 1 if (heading_index < 0)

  elsif (direction == 'R')
    heading_index += 1
    heading_index = 0 if (heading_index >= headings.length)
      
  end

  case headings[heading_index]
  when :north
    for i in 1..distance
      y_position += 1
      if visited.include? (x_position.to_s + ',' + y_position.to_s)
        duplicate_found = true
        break

      end

      visited.push(x_position.to_s + ',' + y_position.to_s)

    end

  when :east
    for i in 1..distance
      x_position += 1
      if visited.include? (x_position.to_s + ',' + y_position.to_s)
        duplicate_found = true
        break

      end

      visited.push(x_position.to_s + ',' + y_position.to_s)

    end
    
  when :south
    for i in 1..distance
      y_position -= 1
      if visited.include? (x_position.to_s + ',' + y_position.to_s)
        duplicate_found = true
        break

      end

      visited.push(x_position.to_s + ',' + y_position.to_s)

    end

  when :west
    for i in 1..distance
      x_position -= 1
      if visited.include? (x_position.to_s + ',' + y_position.to_s)
        duplicate_found = true
        break

      end

      visited.push(x_position.to_s + ',' + y_position.to_s)

    end

  end

  break if duplicate_found
}

puts 'Total distance: ' + (x_position.abs() + y_position.abs()).to_s