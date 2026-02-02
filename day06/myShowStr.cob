       identification division.
       program-id. myShowStr.


       data division.
       working-storage section.
       01  tmp             pic x(1).
       01  idx             pic 9(9).
       01  base            pic x(16) value "0123456789abcdef".
       01  lenBase         pic 9(9).
       01  nbrToDisp       pic 9(9).
       01  tmpNbr          pic 9(9).
       01  nbrIdx          pic 9(9).
       01  nbrRest         pic 9(9).
       01  bufLen          pic 9(9) comp.
       01  buf             pic x occurs 1 to 1000000
           depending on bufLen.

       linkage section.
       01  str             pic x any length.


       procedure division using str.
       perform varying idx
           from 1
           until idx > function length(str)

           move str(idx:1) to tmp
           call "myStrIsPrintable" using tmp
           if return-code = 0
               display "\" with no advancing
               compute nbrToDisp = function ord(tmp) - 1
               perform displayInHex
           else
               display str(idx:1) with no advancing
           end-if

       end-perform.

       display " ".

       go to endProgram.

       displayInHex.
           if nbrToDisp = 0
               display "0" with no advancing
           else
               move function length(base) to lenBase
        
               move 0 to bufLen
               move nbrToDisp to tmpNbr
               perform until tmpNbr = 0
                   divide tmpNbr by lenBase giving tmpNbr
                   add 1 to bufLen
               end-perform

               perform varying nbrIdx from 1 until nbrToDisp = 0
                   divide nbrToDisp by lenBase
                       giving nbrToDisp remainder nbrRest
                   move base(nbrRest + 1:1) to buf(nbrIdx)
               end-perform
        
               perform varying nbrIdx from bufLen by -1 until nbrIdx = 0
                   display buf(nbrIdx) with no advancing
               end-perform
           end-if.
    
       endProgram.

       end program myShowStr.
