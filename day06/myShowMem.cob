       identification division.
       program-id. myShowMem.


       data division.
       working-storage section.
       01  idx             pic 9(9).
       01  lineIdx         pic 9(9).
       01  byteVal         pic 9(9).
       01  hexChars        pic x(16) value "0123456789abcdef".
       01  hexPair         pic x(2).
       01  high4           pic 9(9).
       01  low4            pic 9(9).
       01  addrHex         pic x(8).
       01  tmpAddr         pic 9(9).
       01  digitIdx        pic 9(9).
       01  tmpChar         pic x(1).
       01  asciiLine       pic x(16).
       01  asciiIdx        pic 9(9).

       linkage section.
       01  strPtr          pic x any length.
       01  len             pic 9(9).


       procedure division using strPtr len.

       perform varying idx from 1 by 1 until idx > len
           if function mod(idx - 1, 16) = 0
               if idx > 1
                   display " " with no advancing
                   perform displayAsciiLine
                   display " "
               end-if
               
               compute tmpAddr = (idx - 1)
               perform convertAddrToHex
               display addrHex with no advancing
               display ": " with no advancing
               
               move spaces to asciiLine
               move 0 to asciiIdx
           end-if
           
           move strPtr(idx:1) to tmpChar
           compute byteVal = function ord(tmpChar) - 1
           
           divide byteVal by 16 giving high4 remainder low4
           move hexChars(high4 + 1:1) to hexPair(1:1)
           move hexChars(low4 + 1:1) to hexPair(2:1)
           display hexPair with no advancing
           
           add 1 to asciiIdx
           if byteVal >= 31 and byteVal < 127
               move tmpChar to asciiLine(asciiIdx:1)
           else
               move "." to asciiLine(asciiIdx:1)
           end-if
           
           if function mod(idx, 2) = 0 and idx < len
               display " " with no advancing
           end-if
       end-perform.

       if function mod(len, 16) not = 0
           compute lineIdx = function mod(len, 16)
           perform varying idx from lineIdx by 1 until idx >= 16
               display "  " with no advancing
               if function mod(idx, 2) = 0 and idx < 15
                   display " " with no advancing
               end-if
           end-perform
           if function mod(len, 2) not = 0
               display " " with no advancing
           end-if
       end-if.

       display " " with no advancing.
       compute asciiIdx = function mod(len, 16)
       if asciiIdx = 0
           move 16 to asciiIdx
       end-if.
       perform displayAsciiLine.
       display " ".

       stop run.

       displayAsciiLine.
           display asciiLine(1:asciiIdx) with no advancing.

       convertAddrToHex.
           move "00000000" to addrHex
           if tmpAddr = 0
               exit paragraph
           end-if

           perform varying digitIdx from 8 by -1 until tmpAddr = 0
               divide tmpAddr by 16 
                   giving tmpAddr remainder low4
               move hexChars(low4 + 1:1) to addrHex(digitIdx:1)
           end-perform.

       end program myShowMem.
