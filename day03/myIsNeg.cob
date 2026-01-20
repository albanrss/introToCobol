       identification division.
       program-id. myIsNeg.


       data division.
       linkage section.
       01  nb pic s9(10).


       procedure division using nb.
       if nb < 0
           display "yes"
       else
           display "no"
       end-if.
       exit program.
