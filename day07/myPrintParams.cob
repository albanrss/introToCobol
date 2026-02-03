       identification division.
       program-id. myPrintParams.


       data division.
       working-storage section.
       78  MAX_LENGTH value 128.
       01  commandLineData pic x(MAX_LENGTH).
       01  currentArg pic x(MAX_LENGTH).
       01  ptr pic 9(9) value 0.
       01  lastPtr pic 9(9).


       procedure division.
       accept commandLineData from command-line.
       inspect commandLineData tallying ptr for leading spaces
       add 1 to ptr.
       perform until ptr equals lastPtr
           move ptr to lastPtr
           unstring commandLineData delimited by all space
               into currentArg
               pointer ptr
           if ptr not equals lastPtr
               display currentArg
           end-if
       end-perform.


       end program myPrintParams.
