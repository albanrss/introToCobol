       identification division.
       program-id. myPutNbr.


       data division.
       linkage section.
       01  lk-nb pic s9(10).


       procedure division using lk-nb.
       display lk-nb.
       exit program.
