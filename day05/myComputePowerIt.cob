       identification division.
       program-id. myComputePowerIt.


       data division.
       working-storage section.
       01  result pic 9(9) value 1.

       linkage section.
       01  nb pic s9(9).
       01  p pic s9(9).


       procedure division using nb p.
       if p is negative
           move 0 to return-code
       else
           if p = 0
               move 1 to return-code
           else
               perform until p < 1
                   compute result = result * nb
                   compute p = p - 1
               end-perform
               move result to return-code
           end-if
       end-if.
       goback.

       end program myComputePowerIt.
