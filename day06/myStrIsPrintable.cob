       identification division.
       program-id. myStrIsPrintable.


       data division.
       working-storage section.
       01  idx pic 9(9).

       linkage section.
       01  str pic x any length.


       procedure division using str.
       move 1 to return-code.
       perform varying idx from 1 until idx > function length(str)
           if function ord(str(idx:1)) < 33
               or 127 < function ord(str(idx:1))
               move 0 to return-code
               exit perform
           end-if
       end-perform.


       end program myStrIsPrintable.
       