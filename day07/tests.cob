       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  catDest pic x(11) value "Hello " & x"00".
       01  catSrc pic x(6) value "World".


       procedure division.
       display "myStrCat " catDest " " catSrc.
       call "myStrCat" using catDest catSrc.
       display catDest.

       stop run.
