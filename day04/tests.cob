       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  a pic s9(9) value 2.
       01  b pic s9(9) value -5.
       01  str pic x(5) value 'Hello'.
       01  nbrStr pic x(4) value ' 67 '.
       01  array.
           05 arrayValue pic 9(9) value 8.
           05 arrayValue pic 9(9) value 5.
           05 arrayValue pic 9(9) value 6.
           05 arrayValue pic 9(9) value 2.
           05 arrayValue pic 9(9) value 1.
       01  arraySize pic 9(9) value 5.

       procedure division.
       display "mySwap a=" a " b=" b.
       call "mySwap" using a b.
       display "       a=" a " b=" b.

       display "myPutStr " str.
       call "myPutStr " using str.

       display "myStrLen " str.
       call "myStrLen" using str.
       display return-code.

       display "myEvilStr " str.
       call "myEvilStr" using str.
       display str.

       display "myGetNbr " nbrStr.
       call "myGetNbr" using nbrStr.
       display return-code.

       display "mySortIntArray " array.
       call "mySortIntArray" using array arraySize.
       display array.

       stop run.
