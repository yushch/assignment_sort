class Sort
   attr_accessor :array, :sortarray
   
   def initialize(array)
       @array = array
       @sortarray = []
   end
   
   def insert_sort(array)
       target = [] << array.shift
       while array.length > 0 do
           item = array.shift
           insert(item, target)
       end
       return target
   end
   
   def insert(item, array)
      array << item if array.length == 0
      0.upto(array.length - 1) do |index|
          if array[index] < item && array[index + 1] == nil
             array << item
          elsif array[index] > item && array[index - 1] == nil
             array.insert(0, item)
          elsif array[index] < item && array[index + 1] > item
             array.insert(index+1, item)
          end
      end
   end
   
   def bubble_sort(array)
       change = 0
       (0).upto(array.length - 2) do |index|
           if array[index] > array[index + 1]
              mid = array[index]
              array[index] = array[index + 1]
              array[index + 1] = mid
              change = 1
           end
       end
       return array if change == 0
       bubble_sort(array)
   end
    
    def mergesort(array)
        recursive_array = []
        array.each do |number|
           recursive_array << [number] 
        end
        return recur(recursive_array)
    end
    
    def recur(array)
       mg_array = []
       return array[0] if array.compact.length == 1
       (0 .. (array.length)).step(2) do |index|
           mg_array << merge(array[index], array[index + 1])
       end
       recur(mg_array)
    end
    
    def merge(array1, array2)
       mergearray = []
       loop do
           return nil if array1 == nil && array2 == nil
           return array1 if array2 == nil
           return array2 if array1 == nil
           return mergearray if array1.length == 0 && array2.length == 0
           if array2[0] == nil
                mergearray << array1[0]
                array1.shift
           elsif array1[0] == nil
                mergearray << array2[0]
                array2.shift
           elsif array1[0] != nil && array2[0] != nil
               if array1[0] <= array2[0]
                    mergearray << array1[0] 
                    array1.shift
               elsif array2[0] < array1[0]
                    mergearray << array2[0]
                    array2.shift
               end
           end
       end
    end
end

s = Sort.new([1,3,7,2,5])
puts "----------------"
print s.mergesort([1,3,7,2,5])
puts ""
puts "----------------"