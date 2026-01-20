       identification division.
       program-id. mySwap.


       data division.
       working-storage section.
       01  temp pic s9(9).

       linkage section.
       01  a pic s9(9).
       01  b pic s9(9).


       procedure division using a b.
       move a to temp.
       move b to a.
       move temp to b.
       goback.
