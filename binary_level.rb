# [31, 15, 7, 5, 1]

def binary_level(arr)
  dict = Hash.new(0)

  arr.each do |n|
    binary = n.to_s(2)
    binary.chars.each do |char|
      dict[n] += 1 if char == '1'
    end
  end

  sorted = dict.sort_by { |_key, value| value }.to_h
  sorted.keys
end


p binary_level([31, 15, 7, 5, 1])
