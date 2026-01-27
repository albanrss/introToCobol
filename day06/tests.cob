       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  cpySrc          pic x(5) value "Hello".
       01  cpyDest         pic x(10).
       01  nCpySrc         pic x(5) value "Hello".
       01  nCpyDest        pic x(10).
       01  nCpy            pic 9(9) value 10.
       01  strToRev        pic x(5) value "Hello".
       01  haystack        pic x(11) value "Hello World".
       01  needle          pic x(5) value "World".
       01  strToComp1      pic x(2) value "ab".
       01  strToComp2      pic x(1) value "a".
       01  strToCompN1     pic x(1) value "a".
       01  strToCompN2     pic x(2) value "ab".
       01  nCmp            pic 9(9) value 2.
       01  strToUpCase     pic x(20) value "Hello-la Team".
       01  strToLowCase    pic x(20) value "Hello-la Team".
       01  strToCapitalize pic x(50) value
           "hey, how are you? 42WORds forty-two; fifty+one".
       01  isStrAlpha      pic x(50) value "yo-la team".
       01  isStrNum        pic x(2) value "09".
       01  isStrLower      pic x(50) value "loWer".
       01  isStrUpper      pic x(50) value "UPPEr".
       01  isStrPrintable  pic x(1) value X'20'.
       01  nbrToPut        pic 9(9) value 0.
       01  baseToPut       pic x(16) value "0123456789ABCDEF".


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

       display "myStrNCmp " strToCompN1 " " strToCompN2 " " nCmp.
       call "myStrNCmp" using strToCompN1 strToCompN2 nCmp.
       display return-code.

       display "myStrUpCase " strToUpCase.
       call "myStrUpCase" using strToUpCase.
       display strToUpCase.

       display "myStrLowCase " strToLowCase.
       call "myStrLowCase" using strToLowCase.
       display strToLowCase.

       display "myStrCapitalize " strToCapitalize.
       call "myStrCapitalize" using strToCapitalize.
       display strToCapitalize.

       display "myStrIsAlpha " isStrAlpha.
       call "myStrIsAlpha" using isStrAlpha.
       display return-code.

       display "myStrIsNum " isStrNum.
       call "myStrIsNum" using isStrNum.
       display return-code.

       display "myStrIsLower " isStrLower.
       call "myStrIsLower" using isStrLower.
       display return-code.

       display "myStrIsUpper " isStrUpper.
       call "myStrIsUpper" using isStrUpper.
       display return-code.

       display "myStrIsPrintable '" isStrPrintable "'".
       call "myStrIsPrintable" using isStrPrintable.
       display return-code.

       display "myPutNbrBase " nbrToPut " " baseToPut.
       call "myPutNbrBase" using nbrToPut baseToPut.

       stop run.
