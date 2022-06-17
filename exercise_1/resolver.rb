# write code here...
def pairedElements(arr, sum)
  index_low = 0
  index_high = arr.size - 1
  arr_result = []
  arr.sort

  while index_low < index_high
    temp = arr[index_low] + arr[index_high]
    if temp == sum && arr[index_low] != arr[index_high]
      arr_result << [arr[index_low], arr[index_high]]
    end
    temp > sum ? index_high -= 1 : index_low += 1
  end

  puts "f(#{sum}, #{arr}) -> #{arr_result}"
end
