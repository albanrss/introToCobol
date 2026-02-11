       identification division.
       program-id. myParamsToList.


       data division.
       working-storage section.
       01  ws-index     pic 9(4) value 0.
       01  ws-arg-ptr   pointer.

       linkage section.
       01  lk-argc      pic 9(4).
       01  lk-argv.
           05  lk-arg   pointer occurs 100.
       01  lk-head-ptr  pointer.


       procedure division using lk-argc lk-argv lk-head-ptr.
       set lk-head-ptr to null
       move 1 to ws-index
       perform until ws-index > lk-argc
           set ws-arg-ptr to lk-arg(ws-index)
           call "addNodeToStart" using lk-head-ptr ws-arg-ptr
           add 1 to ws-index
       end-perform.

       goback.

       end program myParamsToList.
