       identification division.
       program-id. myPrintComb.


       data division.
       working-storage section.
       01  ws-nb           pic 9(3).
       01  needToDisplay   pic x value "N".
       01  nbToDisplay     pic 9(3).


       procedure division.
       perform varying ws-nb from 0 by 1 until ws-nb = 999
           if (
            ws-nb(1:1) < ws-nb(2:1)) and (ws-nb(2:1) < ws-nb(3:1)
            ) then
               if needToDisplay = "Y" then
                   move "N" to needToDisplay
                   display nbToDisplay ", " with no advancing
               end-if
               move "Y" to needToDisplay
               move ws-nb to nbToDisplay
           end-if
       end-perform.

       display nbToDisplay.

       exit program.
