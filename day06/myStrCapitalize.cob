       identification division.
       program-id. myStrCapitalize.


       data division.
       working-storage section.
       01  newWord pic x value 'Y'.
       01  idx pic 9(9).

       linkage section.
       01  str pic x any length.


       procedure division using str.
       call "myStrLowCase" using str.
       perform varying idx from 1 until idx > function length(str)
           if 'a' <= str(idx:1) and str(idx:1) <= 'z'
               if newWord = 'Y'
                      move function char(
                          function ord(str(idx:1))
                          + (function ord('A') - function ord('a'))
                          )
                          to str(idx:1)
                     move 'N' to newWord
               end-if
           else
               move 'Y' to newWord
           end-if
       end-perform.


       end program myStrCapitalize.
