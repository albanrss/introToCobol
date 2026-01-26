       identification division.
       program-id. myStrNCpy.


       data division.
       linkage section.
       01  destStr pic x any length.
       01  srcStr pic x any length.
       01  n pic 9(9).


       procedure division using destStr srcStr n.
       move srcStr(1 : n) to destStr(1 : n).


       end program myStrNCpy.
