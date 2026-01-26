       identification division.
       program-id. myStrStr.


       data division.
       working-storage section.
       01  idx pic 9(9).
       01  lenHayStack pic 9(9).
       01  lenNeedle pic 9(9).
       01  lim pic 9(9).

       linkage section.
       01  hayStack pic x any length.
       01  needle pic x any length.


       procedure division using hayStack needle.
       move -1 to return-code.
       move function length(hayStack) to lenHayStack.
       move function length(needle) to lenNeedle.
       compute lim = 1 + lenHayStack - lenNeedle.
       perform varying idx from 1 until idx > lim
           if hayStack(idx:lenNeedle) = needle
               move idx to return-code
           end-if
       end-perform.


       end program myStrStr.
