       identification division.
       program-id. myStrIsLower.


       data division.
       linkage section.
       01  str pic x any length.


       procedure division using str.
       if str is alphabetic-lower
           move 1 to return-code
       else
           move 0 to return-code
       end-if.


       end program myStrIsLower.
       