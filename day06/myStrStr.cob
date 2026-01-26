       identification division.
       program-id. myStrStr.


       data division.
       working-storage section.
       01  idx pic 9(9).
       01  lenHayStack pic 9(9).
       01  lenNeedle pic 9(9).
       01  lim pic s9(9).

       linkage section.
       01  hayStack pic x any length.
       01  needle pic x any length.


       procedure division using hayStack needle.
       move -1 to return-code.
       move function length(hayStack) to lenHayStack.
       move function length(needle) to lenNeedle.

       if lenNeedle > lenHayStack
           go to program-end
       end-if.

       if lenNeedle = 0
           move 0 to return-code
           go to program-end
       end-if.

       compute lim = 1 + lenHayStack - lenNeedle.
       perform varying idx from 1 until idx > lim
           if hayStack(idx:lenNeedle) = needle
               move idx to return-code
               exit perform
           end-if
       end-perform.

       program-end.

       end program myStrStr.
