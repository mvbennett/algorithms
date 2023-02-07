=begin
Given a matrix of characters a-z and a word, return a boolean as to whether the word can be found within the matrix. Words can only be built from adjacent letters (up, down, left, right), but not diagonals. Same elements cannot be used multiple times in the same word.

Input: Matrix of characters from a-z, String word
Output: Boolean as to whether word can be found in matrix

Input:

[['a', 'b', 'c', 'd'],
 ['e', 'f', 'g', 'h'],
 ['i', 'd', 'o', 'j'],
 ['k', 'l', 'm', 'n']]

'dog'

Output: true

Where M = matrix height, N = matrix width, L = length of word

Time Complexity: O(MN * 3^L)
Auxiliary Space Complexity: O(MN)

Diargram:
valid_strings = dog || god

      ----------------|
    [['a', 'b', 'c', <-'d'],
      i----------|    |
     ['e', 'f', 'g', 'h'],
            |--- |
     ['i', 'd', 'o', 'j'],

     ['k', 'l', 'm', 'n']]

Pseudocode:
visited = []
existence = false

  find_string(string, target_char, row, col):
    if row < 0 || col < 0 || row >= matrix.length col >= matrix.first.length:
      return
    if visited.has("[row]_[col]"):
      return
    if matrix[row][col] == target_char:
      string += matrix[row][col]
      target_char = next char

    visited << "[row]_[col]"
    if string == target_string:
      existence = true
      return

    find_string(string, target_char, row + 1, col)
    find_string(string, target_char, row, col + 1)
    find_string(string, target_char, row - 1, col)
    find_string(string, target_char, row, col - 1)
    visited.delete("[row]_[col]")

  find_string('', target_char[0], 0, 0)
=end

def string_exists?(matrix, target_string)
  visited = []
  existence = false

  find_string = lambda do |string, char_index, row, col|
    return if row.negative? || col.negative? || row >= matrix.length || col >= matrix.first.length
    return if visited.include?("#{row}_#{col}")
    if matrix[row][col] == target_string[char_index]
      string += matrix[row][col]
      char_index += 1
    else
      char_index = 0
    end
    visited << "#{row}_#{col}"
    return existence = true if string == target_string

    find_string.call(string, char_index, row + 1, col)
    find_string.call(string, char_index, row, col + 1)
    find_string.call(string, char_index, row - 1, col)
    find_string.call(string, char_index, row, col - 1)
    visited.delete("#{row}_#{col}")
  end
  matrix.each_with_index do |row, row_index|
    row.each_index do |col_index|
      find_string.call('', 0, row_index, col_index)
    end
  end
  existence
end

p string_exists?([['a', 'b', 'c', 'd'],
 ['e', 'f', 'g', 'h'],
 ['i', 'd', 'o', 'j'],
 ['k', 'l', 'm', 'n']], 'dog')


p string_exists?([['o', 'd', 'c', 'q'],
 ['g', 'f', 'g', 'h'],
 ['i', 'w', 'o', 'j'],
 ['k', 'l', 'm', 'n']], 'dog')

p string_exists?([['u', 'd', 'c', 'q'],
 ['g', 'f', 'g', 'h'],
 ['i', 'w', 'o', 'j'],
 ['k', 'l', 'm', 'n']], 'dog')
