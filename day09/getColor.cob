       identification division.
       program-id. getColor.


       data division.
       working-storage section.
       01  alphaValue pic 9(9) value zeroes.
       01  redValue pic 9(9) value zeroes.
       01  greenValue pic 9(9) value zeroes.
       01  blueValue pic 9(9) value zeroes.

       linkage section.
       01  red pic X.
       01  green pic X.
       01  blue pic X.
       01  result pic 9(10) value zeroes.


       procedure division using red green blue result.
       move 255 to alphaValue.
       compute redValue = function ord(red) - 1.
       compute greenValue = function ord(green) - 1.
       compute blueValue = function ord(blue) - 1.

       compute result = result + alphaValue * (2 ** 24).
       compute result = result + redValue * (2 ** 16).
       compute result = result + greenValue * (2 ** 8).
       compute result = result + blueValue * (2 ** 0).


       end program getColor.
