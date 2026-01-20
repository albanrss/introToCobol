       identification division.
       program-id. myStrLen.


       data division.
       linkage section.
       01  str pic x any length.


       procedure division using str.
       move function length(str) to return-code.
       end program myStrLen.
