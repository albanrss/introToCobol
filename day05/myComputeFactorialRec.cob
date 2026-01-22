       identification division.
       program-id. myComputeFactorialRec is recursive.


       data division.
       local-storage section.
       01  inputNb pic s9(9).

       linkage section.
       01  nb pic s9(9).


       procedure division using nb.
       if nb is negative
           move 0 to return-code
       else
           if nb = 0 or nb = 1
               move 1 to return-code
           else
               subtract 1 from nb giving inputNb
               call "myComputeFactorialRec" using inputNb
               multiply return-code by nb giving return-code
           end-if
       end-if.
       exit program.

       end program myComputeFactorialRec.
