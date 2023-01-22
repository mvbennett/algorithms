class Permutations
  def initialize
    @sum = []
  end

  def combos(build, depth, string)
    return @sum << build if depth == string.length

    combos(build, depth + 1, string)
    combos(build += string[depth], depth + 1, string)
  end

  def get_permutations(string)
    combos('', 0, string)
    return @sum
  end
end

test_case = Permutations.new
p test_case.get_permutations('abc')
