       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  factIt pic s9(9) value 4.
       01  factRec pic s9(9) value -5.
       01  nbPowerIt pic s9(9) value 4.
       01  pPowerIt pic s9(9) value 4.
       01  nbPowerRec pic s9(9) value 4.
       01  pPowerRec pic s9(9) value -5.
       01  nbToSquareRoot pic s9(9) value 1.

       procedure division.
       display "myComputeFactorialIt " factIt.
       call "myComputeFactorialIt" using factIt.
       display return-code.

       display "myComputeFactorialRec " factRec.
       call "myComputeFactorialRec" using factRec.
       display return-code.

       display "myComputePowerIt " nbPowerIt " " pPowerIt.
       call "myComputePowerIt" using nbPowerIt pPowerIt.
       display return-code.

       display "myComputePowerRec " nbPowerRec " " pPowerRec.
       call "myComputePowerRec" using nbPowerRec pPowerRec.
       display return-code.

       display "myComputeSquareRoot " nbToSquareRoot.
       call "myComputeSquareRoot" using nbToSquareRoot.
       display return-code.

       stop run.
