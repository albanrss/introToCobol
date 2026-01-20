       identification division.
       program-id. myPrintDigits.


       data division.
       working-storage section.
       01  ws-idx  pic 9(2) value 0.
       01  ws-buff pic 9(10).


       procedure division.
       perform varying ws-idx from 0 by 1 until ws-idx > 9
           move ws-idx(2:1) to ws-buff(ws-idx + 1:1)
       end-perform.
       display ws-buff.
       exit program.
