command_lines = []
File.open('inputs/day2.txt') {|f|
  f.each_line {|line|
    command_lines.push(line)
  }
}

keypad = [['#','#','#','#','#','#','#'],['#','#','#','1','#','#','#'],['#','#','2','3','4','#','#'],['#','5','6','7','8','9','#'],['#','#','A','B','C','#','#'],['#','#','#','D','#','#','#'],['#','#','#','#','#','#','#']]

key_code = ''

# Start in the center of the array (number 5)
x_position = 2
y_position = 2

command_lines.each {|command|
  command.each_char {|char|
    case char
    when 'U'
      y_position -=1 if keypad[y_position-1][x_position] != '#'
        
    when 'D'
      y_position +=1 if keypad[y_position+1][x_position] != '#'

    when 'R'
      x_position +=1 if keypad[y_position][x_position+1] != '#'

    when 'L'
      x_position -=1 if keypad[y_position][x_position-1] != '#'

    end
  }

  key_code += keypad[y_position][x_position]
}

puts key_code