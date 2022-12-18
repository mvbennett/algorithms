var twoSum = function(nums, target) {
  const checked = {};
  let result;
  nums.map((num, i) => {
      const diff = (target - num).toString();
      if (checked[diff] !== undefined) {
          result = [checked[diff], i];
      } else {
          checked[nums[i]] = i;
      }
  })
  return result;
};
