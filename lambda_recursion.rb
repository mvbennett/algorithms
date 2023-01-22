def get_perms(string)
  perms = []

  combos = lambda do |build, depth|
    return perms << build if depth == string.length

    combos.call(build, depth + 1)
    combos.call(build + string[depth], depth + 1)
  end

  combos.call('', 0)

  perms
end

p get_perms('abc')
