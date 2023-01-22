class Permutations
  def initialize(string)
    @string = string
    @sum = []
  end

  def combos(build, depth)
    return @sum << build if depth == @string.length

    combos(build, depth + 1)
    combos(build += @string[depth], depth + 1)
  end

  def get_permutations
    combos('', @string.length)
    return @sum
  end
end

test_case = new Permutations("abc")
p test_case.get_permutations
