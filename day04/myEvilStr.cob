       identification division.
       program-id. myEvilStr.


       data division.
       working-storage section.
       01  len pic 9(9).
       01  idx pic 9(9).
       01  temp pic x.

       linkage section.
       01  str pic x any length.


       procedure division using str.
       move function length(str) to len.
       perform varying idx from 1 until idx > len / 2
           move str(idx : 1) to temp
           move str(len - idx + 1 : 1) to str(idx:1)
           move temp to str(len - idx + 1 : 1)
       end-perform.

       end program myEvilStr.
