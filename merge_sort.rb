# Runtime is O(n log n) | Memory O(n) (need another array of same size)

def merge_sort(array)
  if array.length <= 1
    array
  else
    mid = (array.length / 2)
    left = merge_sort(array[0..mid-1])
    right = merge_sort(array[mid..array.length])
    merge(left, right)
  end
end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

array = [5,6,4,8,9,2,1,10,3,20,25,60,7,12]

print merge_sort(array)