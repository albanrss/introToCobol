       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  cpySrc pic x(5) value "Hello".
       01  cpyDest pic x(10).
       01  nCpySrc pic x(5) value "Hello".
       01  nCpyDest pic x(10).
       01  nCpy pic 9(9) value 10.

       procedure division.
       display "myStrCpy " cpySrc.
       call "myStrCpy" using cpyDest cpySrc.
       display "cpy = " cpyDest.

       display "myStrNCpy " nCpySrc " " nCpy.
       call "myStrNCpy" using nCpyDest nCpySrc nCpy.
       display "cpy = " nCpyDest.

       stop run.
