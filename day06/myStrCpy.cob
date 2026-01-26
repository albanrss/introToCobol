       identification division.
       program-id. myStrCpy.
       

       data division.
       linkage section.
       01  dest pic x any length.
       01  src pic x any length.


       procedure division using dest src.
       move src to dest.

       end program myStrCpy.
