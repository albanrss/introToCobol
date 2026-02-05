       identification division.
       program-id. swapEndianColor.


       data division.
       working-storage section.
       01  alphaValue pic 9(9) value zeroes.
       01  redValue pic 9(9) value zeroes.
       01  greenValue pic 9(9) value zeroes.
       01  blueValue pic 9(9) value zeroes.
       01  tempValue pic 9(10) value zeroes.

       linkage section.
       01  colorValue pic 9(10).


       procedure division using colorValue.

       move colorValue to tempValue.

       compute blueValue = function mod(tempValue, 256).
       compute tempValue = tempValue / 256.

       compute greenValue = function mod(tempValue, 256).
       compute tempValue = tempValue / 256.

       compute redValue = function mod(tempValue, 256).
       compute tempValue = tempValue / 256.

       compute alphaValue = function mod(tempValue, 256).

       move zeroes to colorValue.
       compute colorValue = colorValue + blueValue * (2 ** 24).
       compute colorValue = colorValue + greenValue * (2 ** 16).
       compute colorValue = colorValue + redValue * (2 ** 8).
       compute colorValue = colorValue + alphaValue * (2 ** 0).

       end program swapEndianColor.
