       identification division.
       program-id. myStrCmp.


       data division.
       working-storage section.
       01  idx pic 9(9).
       01  c1 pic 9(9).
       01  c2 pic 9(9).

       linkage section.
       01  str1 pic x any length.
       01  str2 pic x any length.


       procedure division using str1 str2.
       move 0 to return-code.
       perform varying idx from 0
           until idx > function length(str1)
           or idx > function length(str2)
           if function ord(str1(idx:1)) not = function ord(str2(idx:1))
               exit perform
           end-if
       end-perform.

       move function ord(str1(idx:1)) to c1.
       move function ord(str2(idx:1)) to c2.

       if idx > function length(str1)
           move 0 to c1
       end-if.
       if idx > function length(str2)
           move 0 to c2
       end-if.

       subtract c2 from c1 giving return-code.

       end program myStrCmp.
