       identification division.
       program-id. mySortIntArray.


       data division.
       working-storage section.
       01  temp pic 9(9).
       01  idx pic 9(9) value 1.

       linkage section.
       01  arraySize pic 9(9).
       01  array.
           05 arrayValue pic 9(9) occurs 1 to 1000 times
               depending on arraySize.


       procedure division using array arraySize.
       perform until idx > arraySize - 1
           if arrayValue(idx) > arrayValue(idx + 1)
               move arrayValue(idx) to temp
               move arrayValue(idx + 1) to arrayValue(idx)
               move temp to arrayValue(idx + 1)
               move 1 to idx
           else
               add 1 to idx
           end-if
       end-perform.


       end program mySortIntArray.
