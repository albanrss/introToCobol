       identification division.
       program-id. myStrNCat.


       data division.
       working-storage section.
       01  idx pic 9(9).

       linkage section.
       01  src pic x any length.
       01  dest pic x any length.
       01  n pic 9(9).


       procedure division using dest src n.
       perform varying idx
           from function length(dest) by -1 until idx = 0
           if dest(idx:1) not = ' '
               move x"00" to dest(idx + 1 : 1)
               exit perform
           end-if
       end-perform.
       string dest delimited by x"00"
              src(1:n) delimited by size
              into dest
       end-string.


       end program myStrNCat.
