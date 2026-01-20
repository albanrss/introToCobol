       identification division.
       program-id. myPrintComb2.


       data division.
       working-storage section.
       01  ws-nbR          pic 9(10) value 0.
       01  ws-nbL          pic 9(10) value 0.
       01  ws-nbRDisp      pic 9(10) value 0.
       01  ws-nbLDisp      pic 9(10) value 0.
       01  ws-needToDisp   pic x value "N".
       01  ws-nbLoop       pic 9(10) value 0.
       01  ws-empty        pic 9(10) value 0.

       linkage section.
       01  lk-len          pic s9(10).


       procedure division using lk-len.
       if lk-len < 0 then
           exit program
       end-if.

       compute ws-nbLoop = (10**lk-len) * (10**lk-len).

       perform ws-nbLoop times
           if (
            ws-nbL(11 - lk-len : lk-len) < 
            ws-nbR(11 - lk-len : lk-len)
           ) then
               if ws-needToDisp = "Y"
                   move "N" to ws-needToDisp
                   display ws-nbLDisp(11 - lk-len : lk-len) " "
                    ws-nbRDisp(11 - lk-len : lk-len) ", "
                    with no advancing
               end-if

               move ws-nbL to ws-nbLDisp
               move ws-nbR to ws-nbRDisp
               move "Y" to ws-needToDisp
           end-if

           add 1 to ws-nbR
           if (
            ws-nbR(11 - lk-len : lk-len) =
            ws-empty(11 - lk-len : lk-len)
            ) then
               add 1 to ws-nbL
           end-if
       end-perform.

       display ws-nbLDisp(11 - lk-len : lk-len) " "
        ws-nbRDisp(11 - lk-len : lk-len)

       exit program.
