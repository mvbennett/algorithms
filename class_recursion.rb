# frozen_string_literal: true

# class Permutations
#   def initialize
#     @sum = []
#   end
#
#   def combos(build, depth, string)
#     return @sum << build if depth == string.length
#
#     combos(build, depth + 1, string)
#     combos(build + string[depth], depth + 1, string)
#   end
#
#   def get_permutations(string)
#     combos('', 0, string)
#     return @sum
#   end
# end
#
# test_case = Permutations.new
# p test_case.get_permutations('abc')

# class for permuatation
class Permutations
  def initialize(string)
    @string = string
    @sum = []
  end

  def combos(build, depth)
    return @sum << build if depth == @string.length

    combos(build, depth + 1)
    combos(build + @string[depth], depth + 1)
  end

  def permutate
    combos('', 0)
    @sum
  end
end

test_case = Permutations.new('abc')
p test_case.permutate
