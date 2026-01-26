       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  cpySrc pic x(5) value "Hello".
       01  destSrc pic x(10).

       procedure division.
       display "myStrCpy " cpySrc.
       call "myStrCpy" using destSrc cpySrc.
       display "cpy = " destSrc.

       stop run.
