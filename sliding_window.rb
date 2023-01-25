# Complete the 'minimumWindowSubstring' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING fullString
#  2. STRING chars
#

def minimumWindowSubstring(fullString, chars)
  left = 0
  right = 0
  counts = chars.chars.to_h { |char| [char, 0] }
  chars.chars.each { |char| counts[char] += 1 }
  missing = chars.length
  result = [0, fullString.length + 1]
  while right < fullString.length
      if missing > 0
          unless counts[fullString[right]].nil?
              missing -= 1 if counts[fullString[right]] > 0
              counts[fullString[right]] -= 1
          end
          right += 1
      end

      while missing == 0
          unless counts[fullString[left]].nil?
              result = [left, right] if (right - left) < (result[1]- result[0])
              counts[fullString[left]] += 1
              missing += 1 if counts[fullString[left]] > 0
          end
          left += 1
      end
  end
  if result[1] < fullString.length + 1
      return fullString.slice(result[0], result[1] - 1)
  else
      return ""
  end
end


p minimumWindowSubstring("ADOBECODEBANC", "ABC")
p minimumWindowSubstring("ADOBECODEBANC", "DB")
p minimumWindowSubstring("HELLO WORLD", "FOB")
