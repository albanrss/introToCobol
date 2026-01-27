       identification division.
       program-id. myStrUpCase.


       data division.
       working-storage section.
       01  idx pic 9(9).

       linkage section.
       01  str pic X any length.


       procedure division using str.
       perform varying idx from 1 until idx > function length(str)
           if 'a' <= str(idx:1) and str(idx:1) <= 'z'
               move function char(
                   function ord(str(idx:1))
                   + (function ord('A') - function ord('a'))
                   )
                   to str(idx:1)
           end-if
       end-perform.


       end program myStrUpCase.
