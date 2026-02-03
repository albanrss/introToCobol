       identification division.
       program-id. myPrintParams.


       data division.
       working-storage section.
       01  commandLineData pic x(256).


       procedure division.
       accept commandLineData from command-line.
       display commandLineData.


       end program myPrintParams.
