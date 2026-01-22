       identification division.
       program-id. myIsPrime.


       data division.
       working-storage section.
       01  idx pic 9(9).
       01  divRem pic 9(9).
       01  tmp pic 9(9).

       linkage section.
       01  nb pic s9(9).


       procedure division using nb.
       move 0 to return-code
       if nb > 1
           move 1 to return-code
           perform varying idx from 2 until idx > nb / 2 + 1
               divide nb by idx giving tmp remainder divRem
               if divRem = 0
                   move 0 to return-code
                   exit perform
               end-if
           end-perform
       end-if.


       end program myIsPrime.
