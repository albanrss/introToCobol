       identification division.
       program-id. mySortParams.


       data division.
       working-storage section.
       78  MAX_LENGTH value 128.
       78  MAX_ARGS value 50.
       01  commandLineData pic x(MAX_LENGTH).
       01  currentArg pic x(MAX_LENGTH).
       01  ptr pic 9(9) value 0.
       01  lastPtr pic 9(9).
       01  argCount pic 9(9) value 0.
       01  argArray.
           05 args occurs MAX_ARGS times pic x(MAX_LENGTH).
       01  i pic 9(9).
       01  j pic 9(9).
       01  tempArg pic x(MAX_LENGTH).


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
               add 1 to argCount
               move currentArg to args(argCount)
           end-if
       end-perform.

       perform varying i from 1 by 1 until i > argCount - 1
           perform varying j from 1 by 1 until j > argCount - i
               if args(j) > args(j + 1)
                   move args(j) to tempArg
                   move args(j + 1) to args(j)
                   move tempArg to args(j + 1)
               end-if
           end-perform
       end-perform.

       perform varying i from 1 until i > argCount
           display args(i)
       end-perform.


       end program mySortParams.
