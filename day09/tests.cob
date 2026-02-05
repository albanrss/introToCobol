       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  red pic x value x'01'.
       01  green pic x value x'02'.
       01  blue pic x value x'03'.
       01  colorResult pic 9(10).


       procedure division.
       display "getColor "
           function ord(red) " "
           function ord(green) " "
           function ord(blue).
       call "getColor" using red green blue colorResult.
       display colorResult.


       stop run.
