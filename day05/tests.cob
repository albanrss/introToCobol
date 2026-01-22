       identification division.
       program-id. tests.


       data division.
       working-storage section.
       01  factIt pic s9(9) value 4.
       01  factRec pic s9(9) value 4.

       procedure division.
       display "myComputeFactorialIt " factIt.
       call "myComputeFactorialIt" using factIt.
       display return-code.

       display "myComputeFactorialRec " factRec.
       call "myComputeFactorialRec" using factRec.
       display return-code.

       stop run.
