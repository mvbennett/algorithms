class SpiralMatrix
  attr_reader :spiral

  def initialize(matrix)
    @matrix = matrix
    @spiral = []
    spiralize
  end

  def spiralize
    return if @matrix.nil? || @matrix.empty?

    min_row, min_col = 0, 0
    max_row, max_col = @matrix.length - 1, @matrix.first.length - 1

    while min_col <= max_col && min_row <= max_row
      right(min_col, max_col, min_row)
      min_row += 1

      down(min_row, max_row, max_col)
      max_col -= 1

      left(max_col, min_col, max_row)
      max_row -= 1

      up(max_row, min_row, min_col)
      min_col += 1
    end
  end

  private

  def right(start, goal, row)
    while start <= goal
      @spiral << @matrix[row][start]
      start += 1
    end
  end

  def down(start, goal, col)
    while start <= goal
      @spiral << @matrix[start][col]
      start += 1
    end
  end

  def left(start, goal, row)
    while start >= goal
      @spiral << @matrix[row][start]
      start -= 1
    end
  end

  def up(start, goal, col)
    while start >= goal
      @spiral << @matrix[start][col]
      start -= 1
    end
  end
end

matrix = [
  [
    1, 2 , 3
  ],
  [
    8, 9, 4
  ],
  [
    7, 6, 5
  ]
]

four_by_four = [
  [
    9, 8, 7, 6
  ],
  [
    8, 7, 6, 5
  ],
  [
    9, 4, 5, 4
  ],
  [
    0, 1, 2, 3
  ]
]

great_book = [
  [
    'U', 'z', 'u'
  ],
  [
    '!', '!', 'm'
  ],
  [
    'i', 'k', 'a'
  ]
]

p SpiralMatrix.new(great_book).spiral.join

describe 'SpiralMatrix' do
  context 'when given the spiral' do
    it 'should show you the beauty of the spiral' do
      spiral = SpiralMatrix.new(matrix)
      p spiral.spiral
      expect(spiral.spiral).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  context 'when given a bigger spiral' do
    it 'should also show the beauty of that spiral' do
      four = SpiralMatrix.new(four_by_four)
      p four.spiral
      expect(four.spiral).to eq([9, 8, 7, 6, 5, 4, 3, 2, 1, 0, 9, 8, 7, 6, 5, 4])
    end
  end

  context 'when given a great book' do
    it 'should tell you about a great horror book' do
      uzu = SpiralMatrix.new(great_book)
      puts uzu.spiral.join
      expect(uzu.spiral.join).to eq('Uzumaki!!')
    end
  end
end
