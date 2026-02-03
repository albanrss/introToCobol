       identification division.
       program-id. myRevParams.


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

       perform varying i from argCount by -1 until i < 1
           display args(i)
       end-perform.


       end program myRevParams.
