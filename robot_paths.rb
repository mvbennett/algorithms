def robot_paths(matrix)
  paths = 0

  find_paths = lambda do |row, col|
    return if row.zero? || col.zero? || row >= matrix.length || col >= matrix.first.length
    return if matrix[row][col] == 1
    return paths += 1 if row == matrix.length - 1 && col == matrix.first.length - 1

    matrix[row][col] = 1

    find_paths.call(row + 1, col)
    find_paths.call(row, col + 1)
    find_paths.call(row - 1, col)
    find_paths.call(row, col - 1)

    matrix[row][col] = 0
  end
  find_paths.call(0, 0)
  paths
end
