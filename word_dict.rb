def find_words(string, words)

  search = lambda do |str, wrds|
    # p wrds
    # p str
    return true if str == ""
    return false if wrds.empty? && str != ""

    if str.match?(wrds.last)
      split = str.split(wrds.last)
      p split
      wrds.pop
      search.call(split.join, wrds)
      search.call(str, wrds)
    end
    wrds.pop
    search.call(str, wrds)
  end

  search.call(string, words)
end



p find_words("catsanddog", "cats sand and cat dog".split(' ')) # true
# p find_words("catsandog", "cats sand and cat dog".split(' ')) # false
