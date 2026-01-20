       identification division.
       program-id. myPrintCombN.


       data division.
       working-storage section.
       01  ws-nb               pic 9(10).
       01  ws-needToDisplay    pic x value "N".
       01  ws-nbToDisplay      pic 9(10).
       01  ws-lastDigit        pic s9(2).
       01  ws-currDigit        pic 9 value 0.
       01  ws-isGood           pic x value "N".
       01  ws-idx              pic 9 value 0.

       linkage section.
       01  lk-len              pic s9(10).


       procedure division using lk-len.
       if lk-len < 0 then
           exit program
       end-if.

       perform varying ws-nb from 0 until ws-nb = 10**lk-len
           move "Y" to ws-isGood
           move -1 to ws-lastDigit

           perform varying ws-idx from lk-len by -1 until ws-idx = 0
               move ws-nb((11 - ws-idx):1) to ws-currDigit

               if not (ws-currDigit > ws-lastDigit) then
                   move "N" to ws-isGood
               end-if

               move ws-currDigit to ws-lastDigit
           end-perform

           if ws-isGood = "Y" then
               if ws-needToDisplay = "Y" then
                   move "N" to ws-needToDisplay
                   display ws-nbToDisplay(11 - lk-len: lk-len) ", "
                       with no advancing
               end-if

               move "Y" to ws-needToDisplay
               move ws-nb to ws-nbToDisplay
           end-if
       end-perform.

       display ws-nbToDisplay(11 - lk-len: lk-len).

       exit program.
