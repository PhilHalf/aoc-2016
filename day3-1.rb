triangle_lines = []
File.open('inputs/day3.txt') {|f|
  f.each_line {|line|
    triangle_lines.push(line)
  }
}

possible_triangles = 0
combinations = [{:index_1 => 0, :index_2 => 1, :comparator => 2},{:index_1 => 1, :index_2 => 2, :comparator => 0},{:index_1 => 0, :index_2 => 2, :comparator => 1}]

triangle_lines.each {|triangle|
  sides = triangle.split(' ')

  impossible_triangle = false
  combinations.each {|combination|
    if sides[combination[:index_1]].to_i + sides[combination[:index_2]].to_i <= sides[combination[:comparator]].to_i
      impossible_triangle = true
      break
    end
  }

  possible_triangles += 1 if !impossible_triangle
}

puts possible_triangles