       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  nbIsNeg     pic s9(10) value 2000000000.
       01  nbCombN     pic s9(10) value 1.
       01  nbComb2     pic s9(10) value 2.
       01  nbToPut     pic s9(10) value -2147483647.


       procedure division.

       display "myPrintAlpha:"
       call "myPrintAlpha".

       display "myPrintRevAlpha:"
       call "myPrintRevAlpha".

       display "myPrintDigits:".
       call "myPrintDigits".

       display "myIsNeg: " nbIsNeg.
       call "myIsNeg" using nbIsNeg.

       display "myPrintComb:".
       call "myPrintComb".

       display "myPrintCombN:" nbCombN.
       call "myPrintCombN" using nbCombN.

       display "myPrintComb2: " nbComb2.
       call "myPrintComb2" using nbComb2.

       display "myPutNbr: " nbToPut.
       call "myPutNbr" using nbToPut.

       stop run.
