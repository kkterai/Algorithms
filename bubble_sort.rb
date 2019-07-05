# Runtime is O(n^2) | Memory O(1)

def bubble_sort(arr)
  is_sorted = false
  sort_end = arr.length - 1 # last index to compare
  while is_sorted == false
    is_sorted = true
    arr.each.with_index do |value, i|
      if i < sort_end
        if arr[i] > arr[i+1]
          arr[i], arr[i+1] = arr[i+1], arr[i]
          is_sorted = false
        end
      end
    end
    sort_end -= 1
  end
  print arr
  arr
end

array = [5,6,4,8,9,2,1]

bubble_sort(array)