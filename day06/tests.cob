       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  cpySrc pic x(5) value "Hello".
       01  cpyDest pic x(10).
       01  nCpySrc pic x(5) value "Hello".
       01  nCpyDest pic x(10).
       01  nCpy pic 9(9) value 10.
       01  strToRev pic x(5) value "Hello".
       01  haystack pic x(11) value "Hello World".
       01  needle pic x(5) value "World".
       01  strToComp1 pic x(5) value "a".
       01  strToComp2 pic x(5) value "a".


       procedure division.
       display "myStrCpy " cpySrc.
       call "myStrCpy" using cpyDest cpySrc.
       display "cpy = " cpyDest.

       display "myStrNCpy " nCpySrc " " nCpy.
       call "myStrNCpy" using nCpyDest nCpySrc nCpy.
       display "cpy = " nCpyDest.

       display "myRevStr " strToRev.
       call "myRevStr" using strToRev.
       display strToRev.

       display "myStrStr " haystack " " needle.
       call "myStrStr" using haystack needle.
       display return-code.

       display "myStrCmp " strToComp1 " " strToComp2.
       call "myStrCmp" using strToComp1 strToComp2.
       display return-code.

       stop run.
