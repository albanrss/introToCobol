       identification division.
       program-id. myDeleteNodes.


       data division.
       working-storage section.
       copy "myList" replacing ==01  node== by ==01  ws-node based==.
       01  ws-current-ptr pointer.
       01  ws-prev-ptr    pointer.
       01  ws-next-ptr    pointer.
       01  ws-cmp-result  pic s9(9) value 0.
       01  ws-deleted     pic 9(9) value 0.

       linkage section.
       01  lk-head-ptr    pointer.
       01  lk-data-ref    pointer.
       01  lk-cmp-ptr     usage program-pointer.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-current-node==.
       copy "myList" replacing ==01  node== 
                                by ==01  lk-prev-node==.
       01  lk-val1        pic x(1).
       01  lk-val2        pic x(1).


       procedure division using lk-head-ptr lk-data-ref lk-cmp-ptr.
       move 0 to ws-deleted

       if lk-head-ptr = null
           move 0 to return-code
           goback
       end-if

       set ws-prev-ptr to null
       set ws-current-ptr to lk-head-ptr
       set address of lk-current-node to ws-current-ptr

       perform until ws-current-ptr = null
           set address of lk-val1 to nodeValue of lk-current-node
           set address of lk-val2 to lk-data-ref
           call lk-cmp-ptr using lk-val1 lk-val2
           move return-code to ws-cmp-result
           if ws-cmp-result = 0
               set ws-next-ptr to nodeNext of lk-current-node
               if ws-prev-ptr = null
                   set lk-head-ptr to ws-next-ptr
               else
                   set address of lk-prev-node to ws-prev-ptr
                   set nodeNext of lk-prev-node to ws-next-ptr
               end-if
               set address of ws-node to ws-current-ptr
               free ws-node
               add 1 to ws-deleted
               set ws-current-ptr to ws-next-ptr
               set address of lk-current-node to ws-current-ptr
           else
               set ws-prev-ptr to ws-current-ptr
               set ws-current-ptr to nodeNext of lk-current-node
               set address of lk-current-node to ws-current-ptr
           end-if
       end-perform.

       move ws-deleted to return-code.
       goback.

       end program myDeleteNodes.
