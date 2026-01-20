       identification division.
       program-id. myGetNbr.


       data division.
       working-storage section.
       01  nbr pic 9(9) value 0.
       linkage section.
       01  str pic x any length.


       procedure division using str.
       compute nbr = function numval(str).
       move nbr to return-code.

       end program myGetNbr.
