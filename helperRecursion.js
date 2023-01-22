const getPerms = (string) => {
  const result = [];

  const getCombos = (build, depth) => {
    if (depth === string.length) {
      return result.push(build)
    };

    getCombos(build, depth + 1);
    getCombos(build + string[depth], depth + 1);
  }

  getCombos('', 0);

  return result;
}

console.log(getPerms('abc'));
