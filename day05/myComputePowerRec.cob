       identification division.
       program-id. myComputePowerRec is recursive.


       data division.
       local-storage section.
       01  inputP pic s9(9).

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
               subtract 1 from p giving inputP
               call "myComputePowerRec" using nb inputP
               multiply return-code by nb giving return-code
           end-if
       end-if.
       exit program.

       end program myComputePowerRec.
