       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  catDest pic x(11) value "Hello " & x"00".
       01  catSrc pic x(6) value "World".
       01  nCatDest pic x(5) value "AB".
       01  nCatSrc pic x(6) value "CDEFGH".
       01  n pic 9(9) value 1.


       procedure division.
       display "myStrCat " catDest " " catSrc.
       call "myStrCat" using catDest catSrc.
       display catDest.

       display "myStrNCat " nCatDest " " nCatSrc " " n.
       call "myStrNCat" using nCatDest nCatSrc n.
       display nCatDest.

       stop run.
