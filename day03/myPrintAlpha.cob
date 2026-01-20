       identification division.
       program-id. myPrintAlpha.


       data division.
       working-storage section.
       01  ws-idx  pic 9(2).
       01  ws-buff pic x(26).


       procedure division.
       perform varying ws-idx from 1 by 1 until ws-idx > 26
           move function char(65 + ws-idx) to ws-buff(ws-idx:1)
       end-perform.
       display ws-buff.
       exit program.
