       identification division.
       program-id. myPutStr.


       data division.
       linkage section.
       01  str pic x any length.


       procedure division using str.
       display str.
       end program myPutStr.
