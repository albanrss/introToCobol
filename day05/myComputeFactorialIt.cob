       identification division.
       program-id. myComputeFactorialIt.


       data division.
       working-storage section.
       01  result pic 9(9) value 1.

       linkage section.
       01  nb pic s9(9).


       procedure division using nb.
       if nb is negative
           move 0 to return-code
       else
           if nb = 0
               move 1 to return-code
           else
               perform until nb < 1
                   compute result = result * nb
                   compute nb = nb - 1
               end-perform
               move result to return-code
           end-if
       end-if.
       goback.

       end program myComputeFactorialIt.
