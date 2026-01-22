       identification division.
       program-id. myComputeSquareRoot.


       data division.
       working-storage section.
       01  idx pic 9(9).

       linkage section.
       01  nb pic s9(9).


       procedure division using nb.
       move 0 to return-code.
       if nb > 0
           perform varying idx from 1 until idx > nb / 2 + 1
               if idx * idx = nb
                   move idx to return-code
                   exit perform
               end-if
           end-perform
       end-if.


       end program myComputeSquareRoot.
