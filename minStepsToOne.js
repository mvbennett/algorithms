// Teacher's solution

let bcount = 0;

function minStepsToOne(n) {
  bcount++;
  // Base case
  if (n <= 1) {
    return 0;
  }

  // Recursive relations
  // sub1
  let steps = minStepsToOne(n-1);

  // divby2
  if (n % 2 === 0) {
    let divby2 = minStepsToOne(n/2);
    steps = Math.min(steps, divby2);
  }

  // divby3
  if (n % 3 === 0) {
    let divby3 = minStepsToOne(n/3);
    steps = Math.min(steps, divby3);
  }

  // return min steps to 1 from  n
  let result = 1 + steps;
  return result;
}

let cache = {};
let mcount = 0;
function minStepsToOneMemo(n) {
  mcount++;
  // Base case
  if (n <= 1) {
    return 0;
  }

  // check cache for repeated state
  if (n in cache) {
    return cache[n];
  }

  // Recursive relations
  // sub1
  let steps = minStepsToOneMemo(n-1);

  // divby2
  if (n % 2 === 0) {
    let divby2 = minStepsToOneMemo(n/2);
    steps = Math.min(steps, divby2);
  }

  // divby3
  if (n % 3 === 0) {
    let divby3 = minStepsToOneMemo(n/3);
    steps = Math.min(steps, divby3);
  }

  // return min steps to 1 from  n
  let result = 1 + steps;

  // store result for n in cache
  cache[n] = result;

  return result;
}


function minStepsToOneTab(n) {
  // init tabulation data struct
  let tab = new Array(n+1);
  console.log(tab);

  // apply base case to tab
  tab[1] = 0;
  console.log(tab);

  // loop tab, filling solns
  for (let i = 2; i <= n; i++) {
    // sub1
    let steps = tab[i-1];

    // divby2
    if (i % 2 === 0) {
      let divby2 = tab[i/2];
      steps = Math.min(steps, divby2);
    }

    // divby3
    if (i % 3 === 0) {
      let divby3 = tab[i/3];
      steps = Math.min(steps, divby3);
    }

    // return min steps to 1 from  i
    let result = 1 + steps;

    // store result for i in tab
    tab[i] = result;
  }

  // return min steps to 1 from n
  return tab[n];
}

// console.time(`Brute force recursion`);
// console.log(minStepsToOne(400));
// console.timeEnd(`Brute force recursion`);
// console.log(`Call count: ${bcount}`);

// console.time(`Memoization`);
// console.log(minStepsToOneMemo(400));
// console.timeEnd(`Memoization`);
// console.log(`Call count: ${mcount}`);

console.time(`Tabulation`);
console.log(minStepsToOneTab(10000000));
console.timeEnd(`Tabulation`);
